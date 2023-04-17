package chap98_homework.nc230405;

import java.util.ArrayList;
import java.util.List;

import chap98_homework.nc230405.clazz.Card;

public class _02_hw_card {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Card> cardList = 
				new ArrayList<Card>();
		
		cardList.add(new Card("a", 3));
		cardList.add(new Card("b", 1));
		cardList.add(new Card("c", 0));
		cardList.add(new Card("d", 1));
		cardList.add(new Card("e", 2));
		cardList.add(new Card("f", 5));
		
//		Stream<Card> cardStream =
//					cardList.stream();
//		
//		cardStream = 
//				cardStream.filter(c -> 
//						c.getVaildYear() <= 1);
//		
//		cardStream.forEach(c -> 
//			c.validEnlong(3, year -> {
//				System.out.println(year + "년 연장되었습니다.");
//				System.out.println(c.toString());
//			}));
		
		cardList.stream()
				.filter(c -> c.getVaildYear() <= 1)
				.forEach(c -> 
					c.validEnlong(3, year -> {
						System.out.println(year + "년 연장되었습니다.");
						c.setVaildYear(c.getVaildYear() + year);
						System.out.println(c.toString());
					})); 
	}

}
