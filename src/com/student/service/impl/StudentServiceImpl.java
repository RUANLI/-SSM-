package com.student.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.student.entity.Page;
import com.student.entity.Student;
import com.student.mapper.StudentMapper;
import com.student.service.StudentService;

public class StudentServiceImpl implements StudentService {
	//service dao(mapper)
	private StudentMapper  studentMapper ;
	
	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}
	//根据学号查询学生
	@Override
	public List<Student> queryStudentByNo(int stuNo) {
		return  studentMapper.queryStudentByNo(stuNo) ;
	}

	//增加学生
	@Override
	public void addStudent(Student student) {
		studentMapper.addStudent(student);
	}
	//查询全部学生
	@Override
	public List<Student> queryStudents() {
		return	studentMapper.queryStudents();
	}
	//分页查询
	@Override
	public List<Student> queryStudentByPage(Page page, Student student) {
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("page",page);
		map.put("student",student);
		return studentMapper.queryStudentByPage(map);
	}
	//删除学生
	@Override
	public void deleteStudentByNo(int stuNo) {
		studentMapper.deleteStudentByNo(stuNo);	
	}
	
	//修改学生
	@Override
	public int uploadStudentByNo(Student student) {
		return studentMapper.uploadStudentByNo(student);
		
	}
	//获取学生总数
	@Override
	//public int getTotalCount(Student student) {
	public int getTotalCount() {
	int	totalCount=studentMapper.getTotalCount();
		return totalCount;
	}
	//多选删除学生
	@Override
	public int falseDelete(String[] checkedId) {
		return	studentMapper.falseDelete(checkedId);
		
	}
	//根据存储过程删除学生
	@Override
	public void deleteStudentWithPaocedure(int stuNo) {
		studentMapper.deleteStudentWithPaocedure(stuNo);
	}
	//根据存储过程增加学生
	@Override
	public void addStudentWithProcedure(Student student) {
		studentMapper.addStudentWithProcedure(student);
	}

}
