package chap98_homework.nc230405;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import chap98_homework.nc230405.clazz.Student;

public class _01_hw {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Integer> intList = 
				new ArrayList<Integer>();
		
		for(int i = 0; i < 10; i++) {
			intList.add(
					(int)(Math.random() * 10) + 1);
		}
		System.out.println(intList);
		
//		Stream<Integer> intStream = 
//					intList.stream();
//		
//		Stream<Integer> newStream = 
//					intStream.map(num -> num * 3);
//		
//		newStream.forEach(num -> 
//					System.out.print(num + ", "));
		//체이닝기법
		intList.stream()
			   .map(num -> num * 3)
			   .forEach(num ->
			   				System.out.print(num + ", "));
							
		System.out.println();
		System.out.println("----------------------------");
		
		List<Student> sList = 
					new ArrayList<Student>();
		
		sList.add(new Student(1, "홍길동", 100));
		sList.add(new Student(2, "임꺽정", 75));
		sList.add(new Student(3, "장길산", 86));
		sList.add(new Student(4, "정도전", 97));
		sList.add(new Student(5, "이순신", 95));
		
//		Stream<Student> sStream = sList.stream();
//		
//		Stream<Student> aPlusStream =
//				sStream.filter(student -> 
//								student.getScore() >= 95);
//		
////		aPlusStream.forEach(student -> 
////				System.out.println(student.toString()));
//		System.out.println("----------------------------");
//		
//		Stream<Student> aStream =
//				aPlusStream.map(student -> {
//					student.setGrade("A+");
//					return student;
//				});
//		
//		aStream.forEach(student ->
//				System.out.println(student.toString()));
		
		//체이닝기법
		sList.stream()
			 .filter(s -> s.getScore() >= 95)
			 .map(s -> {
				 s.setGrade("A+");
				 return s;
			 })
			 .forEach(s -> 
			 			System.out.println(s.toString()));
		System.out.println("----------------------------");
		
		Scanner sc = new Scanner(System.in);
		List<Character> charList = 
					new ArrayList<Character>();
		
		for(int i = 0; i < 10; i++) {
			System.out.println("영문자 하나를 입력하세요.");
			String input = sc.nextLine();
			charList.add(input.toCharArray()[0]);
		}
		System.out.println(charList);
		
//		Stream<Character> chStream =
//				   		charList.stream();
//		
//		Stream<Character> convStream =
//					chStream.map(ch -> {
//						if(ch >= 'A' && ch <= 'Z') {
//							ch = (char)(ch + 32);
//						} else if(ch >= 'a' && ch <= 'z') {
//							ch = (char)(ch - 32);
//						}
//						
//						return ch;
//					});
//		
//		convStream.forEach(ch ->
//				System.out.print(ch + ", "));
		
		//체이닝기법
		charList.stream()
				.map(ch -> {
					if(ch >= 'A' && ch <= 'Z') {
						ch = (char)(ch + 32);
					} else if(ch >= 'a' && ch <= 'z') {
						ch = (char)(ch - 32);
					}
					
					return ch;
				})
				.forEach(ch -> 
					System.out.print(ch + ", "));
		
		System.out.println("----------------------");
		
		List<String> strList = 
					new ArrayList<String>();
		
		for(int i = 0; i < 10; i++) {
			System.out.println("문자열을 입력하세요.");
			strList.add(sc.nextLine());
		}
		System.out.println(strList);
		
//		Stream<String> strStream =
//					strList.stream();
//		
//		Stream<String> strStream2 = 
//					strStream.filter(str -> {
//						for(int i = 0; i< str.length(); i++) {
//							if((str.charAt(i) >= 'A' && str.charAt(i) <= 'Z') ||
//								(str.charAt(i) >= 'a' && str.charAt(i) <= 'z')) {
//								return true;
//							}
//						}
//						return false;
//					});
//		
//		strStream2.forEach(str ->
//				System.out.println(str));
		
		//체이닝기법
		strList.stream()
			   .filter(str -> {
				   for(int i = 0; i < str.length(); i++) {
					   if((str.charAt(i) >= 'A' && str.charAt(i) <= 'Z')
						|| (str.charAt(i) >= 'a' && str.charAt(i) <= 'z')) {
						   return true;
					   }
				   }
				   return false;
			   })
			   .forEach(str -> System.out.println(str));
			   
		System.out.println("--------------------------");
		
		
		
		
		
		
		
		sc.close();
	}

}
