package chap98_homework.nc230329;

import java.util.Scanner;

public class hw_for03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		int inputNum = sc.nextInt();
		
		for(int i = 2; i <= inputNum; i++) {
			int cnt = 0;
			
			for(int j = 2; j <= i; j++) {
				//자기 자신이 아닌 다른 값으로 나눠 떨어짐
				if(i % j == 0 && i != j) {
					cnt++;
					break;
				}
			}
			
			if(cnt == 0) {
				System.out.println(i);
			}
		}
		
		
		
		
		
		
		
		
	}

}
