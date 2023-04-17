package chap97_practice;

public class Group230411 {

	public static void main(String[] args) {
		
//		#include <stdio.h>
//		#include <stdbool.h>
//		#include <stdlib.h>
//
//		// numbers_len은 배열 numbers의 길이입니다.
//		int* solution(int numbers[], size_t numbers_len) {
//		    // return 값은 malloc 등 동적 할당을 사용해주세요. 할당 길이는 상황에 맞게 변경해주세요.
//		    int* answer = (int*)malloc(1);
//		    return answer;
		    
		
		int[] arr1 = new int[3];
		int[] arr2 = new int[3];
		
		for(int i = 0; i < arr1.length; i++) {
			arr1[i] = i;
			System.out.println(arr1[i]);
		}
		
		for(int i = 0; i < arr1.length; i++) {
			arr2[i] = arr1[i]*2;
			System.out.println(arr2[i]);
		}
		
	}

}
