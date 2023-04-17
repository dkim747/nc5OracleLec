package chap98_homework;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class hw_coll07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<String, Integer> hyundai = 
				new HashMap<String, Integer>();
		Map<String, Integer> kia = 
				new HashMap<String, Integer>();
		
		List<Map<String, Integer>> carList = 
				new ArrayList<Map<String, Integer>>();
		
		hyundai.put("아반떼", 1000);
		hyundai.put("소나타", 2000);
		hyundai.put("그랜저", 3000);
		
		kia.put("k5", 1000);
		kia.put("k7", 2000);
		kia.put("k9", 3000);
		
		carList.add(hyundai);
		carList.add(kia);
		
		List<Entry<String, Integer>> entList =
				new ArrayList<Entry<String, Integer>>();
		
		for(int i = 0; i < carList.size(); i++) {
			Map<String, Integer> map = carList.get(i);
			
			int max = 0;
			Entry<String, Integer> maxEnt = null;
			
			for(Entry<String, Integer> ent :
				map.entrySet()) {
				if(ent.getValue() > max) {
					max = ent.getValue();
					maxEnt = ent;
				}
			}
			entList.add(maxEnt);
		}
		System.out.println(entList);
	}

}
