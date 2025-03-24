package com.board2;

public class Exam {

	public static void main(String[] args) {
		int a = 1;
		int b = 2;
		
		if(a==1) {
			System.out.println("a는 1입니다.");
		}else if(b==2) {
			System.out.println("b는 2입니다.");
		}else {
			System.out.println("a는 1이 아니고 b는 2가 아닙니다.");
		}
		
		if(a==1) {
			System.out.println("a는 1입니다.");
		}
		if(b==2) {
			System.out.println("b는 2입니다.");
		}
		if(a!=1 && b!=2) {
			System.out.println("a는 1이 아니고 b는 2가 아닙니다.");
		}
	}
}
