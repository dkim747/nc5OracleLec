package chap20_lambda;

import java.util.Scanner;

import chap20_lambda.clazz.Calculator;

public class _01_basicLambda {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("정수를 입력하세요");
		int a = sc.nextInt();
		System.out.println("정수를 입력하세요");
		int b = sc.nextInt();
		
		// TODO Auto-generated method stub
		action(a, b, (x, y) -> {
			int result = x + y;
			System.out.println(result);
		});
		
		action(a, b,
		new Calculator() {
			@Override
			public void calculate(int a, int b) {
				// TODO Auto-generated method stub
				
			}
		});
		
		//함수형 인터페이스는 추상메소드 하나만 가질 수 있기 때문에
		//매개변수를 람다식을 이용해 메소드 코드블록처럼 전송하게 되면
		//함수형 인터페이스에서 추상메소드의 구현부 인식
		//함수형 인터페이스의 추상메소드를 action 메소드에서 호출하게 되면
		//구현된 추상메소드를 사용할 수 있다.
		action(a, b, (x, y) -> {
			int result = x - y;
			System.out.println(result);
		});
		
		sc.close();
	}
	
	public static void action(int a, int b, 
						Calculator calc) {		
		calc.calculate(a, b);
	}
	
}
