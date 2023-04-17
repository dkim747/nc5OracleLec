package chap21_stream;

import java.util.Arrays;
import java.util.stream.IntStream;

public class _05_arrayToStream {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] intArr = new int[10];
		
		for(int i = 0; i < 10; i++) {
			intArr[i] = (int)(Math.random() * 10) + 1;
			System.out.print(intArr[i] + ", ");
		}
		System.out.println();
//							//IntStream.of(intArr);
//		IntStream intStream = Arrays.stream(intArr);
//		
//		//5이상인 값들만 스트림으로 만들기
//		IntStream fiveStream = 
//				intStream.filter(a -> a >= 5);			
//		
//		//* 4 새로운 스트림 만들기
//		IntStream fourStream = 
//				fiveStream.map(num -> {
//					int result = 0;
//					result = num * 4;
//					return result;
//				});
//		
//		fourStream.forEach(num -> 
//			System.out.print(num + ", "));
		
		Arrays.stream(intArr)
			  .filter(num -> num >= 5)
			  .map(num -> num * 4)
			  .forEach(num -> System.out.print(num + ", "));
	}

}
