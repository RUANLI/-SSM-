package com.student.shiro;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

public class ShiroRealm extends AuthenticatingRealm {

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//1. 把 AuthenticationToken 转换为 UsernamePasswordToken 
				UsernamePasswordToken upToken = (UsernamePasswordToken) token;
				
				//2. 从 UsernamePasswordToken 中来获取 username
				String username = upToken.getUsername();
				
				//3. 调用数据库的方法, 从数据库中查询 username 对应的用户记录
				System.out.println("从数据库中获取 username: " + username + " 所对应的用户信息.");
				
				//4. 若用户不存在, 则可以抛出 UnknownAccountException 异常
				if("unknown".equals(username)){
					throw new UnknownAccountException("用户不存在!");
				}
				
				//5. 根据用户信息的情况, 决定是否需要抛出其他的 AuthenticationException 异常. 
				if("monster".equals(username)){
					throw new LockedAccountException("用户被锁定");
				}
				
				//6. 根据用户的情况, 来构建 AuthenticationInfo 对象并返回. 通常使用的实现类为: SimpleAuthenticationInfo
				//以下信息是从数据库中获取的.
				//1). principal: 认证的实体信息. 可以是 username, 也可以是数据表对应的用户的实体类对象. 
				Object principal = username;
				//2). credentials: 密码. 
				Object credentials = null; //"fc1709d0a95a6be30bc5926fdb7f22f4";
				if("admin".equals(username)){
					credentials = "038bdaf98f2037b31f1e75b5b4c9b26e";
				}else if("user".equals(username)){
					credentials = "098d2c478e9c11555ce2823231e02ec1";
				}
				
				//3). realmName: 当前 realm 对象的 name. 调用父类的 getName() 方法即可
				String realmName = getName();
				//4). 盐值. 
				ByteSource credentialsSalt = ByteSource.Util.bytes(username);
				
				SimpleAuthenticationInfo info = null; //new SimpleAuthenticationInfo(principal, credentials, realmName);
				info = new SimpleAuthenticationInfo(principal, credentials, credentialsSalt, realmName);
				return info;
			}

			public static void main(String[] args) {
				String hashAlgorithmName = "MD5";
				Object credentials = "123456";
				Object salt = ByteSource.Util.bytes("user");;
				int hashIterations = 1024;
				
				Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
				System.out.println(result);
			}

			//授权会被 shiro 回调的方法
			protected AuthorizationInfo doGetAuthorizationInfo(
					PrincipalCollection principals) {
				//1. 从 PrincipalCollection 中来获取登录用户的信息
				Object principal = principals.getPrimaryPrincipal();
				
				//2. 利用登录的用户的信息来用户当前用户的角色或权限(可能需要查询数据库)
				Set<String> roles = new HashSet<>();
				roles.add("user");
				if("admin".equals(principal)){
					roles.add("admin");
				}
				
				//3. 创建 SimpleAuthorizationInfo, 并设置其 reles 属性.
				SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
				
				//4. 返回 SimpleAuthorizationInfo 对象. 
				return info;
			}
}
