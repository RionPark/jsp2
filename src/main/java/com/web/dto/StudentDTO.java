package com.web.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentDTO {
	private int siNum;
	private String siName;
	private String siAddress;
	private int cnt;
	private List<CourseDTO> courses;
}
