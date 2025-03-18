package com.web.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CourseDTO {
	private int ciNum;
	private String ciName;
	private int ciMax;
	private int cnt;
}
