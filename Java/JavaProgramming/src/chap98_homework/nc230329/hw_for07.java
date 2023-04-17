package chap98_homework.nc230329;

import java.util.Scanner;

public class hw_for07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		
		int min = num1 > num2 ? num2 : num1;
		
		int gcd = 1;
		
		for(int i = 1; i <= min; i++) {
			if(num1 % i == 0 && num2 % i == 0) {
				gcd = i;
			}
		}
		
		int common = num1 * num2 / gcd;
		
		System.out.println("최대공약수 : " + gcd);
		System.out.println("최소공배수 : " + common);
		
		
		
		
		
		
		
	}

}
