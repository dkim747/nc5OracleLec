package chap21_stream;

import java.util.Arrays;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class _09_numberConvertStream {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] intArr = new int[5];
		
		for(int i = 0; i < intArr.length; i++) {
			intArr[i] = (int)(Math.random() * 10) + 1;
		}
		
		IntStream intStream = Arrays.stream(intArr);
		
		intStream.asDoubleStream()
				 .forEach(dNum -> System.out.println(dNum));
		
		intStream = Arrays.stream(intArr);
		
		intStream.filter(num -> num > 5);
		
		Stream<Integer> wrappedStream = intStream.boxed();
		
		wrappedStream.forEach(num -> {
			System.out.println(num);
			System.out.println(num.getClass().getSimpleName());
		});
		
		
		
		
		
	}

}
