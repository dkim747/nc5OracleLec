package chap97_practice;

import java.util.HashMap;
import java.util.Map;

public class Solution {
	public int solution(int[] array) {
		
		Map<Integer, Integer> mp = new HashMap<Integer, Integer>();
		for(int i = 0; i < array.length; i++) {
			if(!mp.containsKey(array[i])) {
				mp.put(array[i], 1);
			}else{
				mp.replace(array[i], mp.get(array[i])+1);
			}
		for문 돌려서
		IF 최빈값이 같으면 -1리턴하고
		아니면 다 더해주는 메소드 만들기
		}
		
	}
}
