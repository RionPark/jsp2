package com.web.service;

import java.util.List;

import com.web.dto.StudentDTO;
import com.web.repository.StudentRepository;

public class StudentService {

	private StudentRepository studentRepo = new StudentRepository();

	public List<StudentDTO> getStudents(StudentDTO student){
		return studentRepo.selectStudents(student);
	}
	public StudentDTO getStudent(int siNum){
		return studentRepo.selectStudent(siNum);
	}
	public int addStudent(StudentDTO student){
		return studentRepo.insertStudent(student);
	}
	public int modifyStudent(StudentDTO student){
		return studentRepo.updateStudent(student);
	}
	public int removeStudent(int siNum) {
		return studentRepo.deleteStudent(siNum);
	}
}
