package com.student.mapper;

import java.util.List;
import java.util.Map;

import com.student.entity.Student;

public interface StudentMapper {
	//增加学生
	public void addStudent(Student student	);
	//存储过程增加学生
	public void addStudentWithProcedure(Student student	);
	//根据学号删除学生
	public void deleteStudentByNo(int stuNo);
	//存储过程删除学生
	public void deleteStudentWithPaocedure(int stuNo);
	//批量删除学生
    public int falseDelete(String[] checkedId);
	//根据学号修改学生信息
	public int uploadStudentByNo(Student student);
	//根据学号查询学生
	public List<Student> queryStudentByNo(int stuNo);
	//查询所有学生
	public List<Student> queryStudents();
	//查询学生总数
	public int getTotalCount();
	//分页查询学生 
	public List<Student> queryStudentByPage(Map<String,Object> map);
}
