package chap20_lambda;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Stream;

import chap20_lambda.clazz.UserCharString;

public class _11_lambdaEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		List<UserCharString> ucsList = 
				new ArrayList<UserCharString>();
		/*List<Map<String, String>> mapList = 
				new ArrayList<Map<String, String>>();
		
		for(int i = 0; i < 5; i++) {
			Map<String, String> map = 
					new HashMap<String, String>();
			/*
			 * {
			 * 		i : i,
			 * 		i : i,
			 * 		i : i
			 * }
			 */
			/*map.put(String.valueOf(i), String.valueOf(i));
			map.put(String.valueOf(i), String.valueOf(i));
			map.put(String.valueOf(i), String.valueOf(i));
			map.put(String.valueOf(i), String.valueOf(i));
			map.put(String.valueOf(i), String.valueOf(i));*/
			
			/*
			 * [
			 * 		{
			 * 			i : i,
			 * 			i : i,
			 * 			i : i
			 * 		},
			 * 		{
			 * 			i : i,
			 * 			i : i,
			 * 			i : i
			 * 		}
			 * 
			 * 
			 * 
			 * ]
			 */
			/*mapList.add(map);
		}*/
		
		//UserCharString ucs = new UserCharString();
		
		for(int i = 0; i < 3; i++) {
			System.out.println("문자열을 입력하세요");
			//String userInput = sc.nextLine();
			//ucsList.add(new UserCharString(userInput));
			ucsList.add(new UserCharString(sc.nextLine()));
		}
		
		System.out.println("찾을 문자를 입력하세요.");
				//sc.nextLine().toCharArr()[0]
		char ch = sc.nextLine().charAt(0);
		
		for(UserCharString u : ucsList) {
			u.changeStr(ch, (c, s) -> {
				String returnStr = "";
				for(int i = 0; i < s.length(); i++) {
					if(s.charAt(i) == c) {
						returnStr = s;
					}
				}
				return returnStr;
			});
		}
		
		Stream<UserCharString> uStream = ucsList.stream();
		uStream.map(u -> {
			u.setStr("aaaa");
			return u;
		});
		
		System.out.println(ucsList);
		
		sc.close();
	}

}
