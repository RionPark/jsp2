package com.web;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
class ExamDTO{
	private int ciNum;
	private String ciName;
	private int ciPrice;
	private String ciDesc;
	private String ciTest;
}
public class Exam {

	public static void main(String[] args) {
		ExamDTO exam = new ExamDTO();
		exam.setCiNum(1);
		exam.setCiName("I5");
		exam.setCiPrice(10000);
		exam.setCiDesc("옛날");
		exam.setCiTest("asdf");
		
		Map<String,Object> map = new HashMap<>();
		map.put("ciNm", 1);
		map.put("ciName", "I5");
		map.put("ciPrice", 10000);
		map.put("ciDesc", "옛날");
		map.put("ciTest", "옛날");
	}
}
