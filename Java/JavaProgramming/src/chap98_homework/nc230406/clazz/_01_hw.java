package chap98_homework.nc230406.clazz;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Stream;

public class _01_hw {

	public static void main(String[] args) {
		//1.
		Scanner sc = new Scanner(System.in);
		
		List<String> strList = new ArrayList<String>();
		
		for(int i = 0; i < 1; i++) {
			System.out.println("문자열을 입력하세요.");
			strList.add(sc.nextLine());
		}
		
		strList.stream()
			   .filter(str -> str.length() >= 5)
			   .forEach(str -> System.out.println(str));
		
		// TODO Auto-generated method stub
		List<HistoricPerson> hpList =
				new ArrayList<HistoricPerson>();
		
		hpList.add(new HistoricPerson("이도", "한글", "조선"));
		hpList.add(new HistoricPerson("이순신", "임진왜란", "조선"));
		hpList.add(new HistoricPerson("담덕", "세력확장", "고구려"));
		hpList.add(new HistoricPerson("장영실", "측우기", "조선"));
		hpList.add(new HistoricPerson("이성계", "조선건국", "조선"));
		hpList.add(new HistoricPerson("을지문덕", "살수대첩", "고구려"));
		hpList.add(new HistoricPerson("이승만", "초대대통령", "대한민국"));
		hpList.add(new HistoricPerson("고주몽", "고려건국", "고려"));
		hpList.add(new HistoricPerson("김구", "독립운동", "대한민국"));
		hpList.add(new HistoricPerson("제갈공명", "책략가", "촉"));
		hpList.add(new HistoricPerson("선우용녀", "책략가", "촉"));
		
		Stream<HistoricPerson> hpStream = hpList.stream();
		
		System.out.println("검색할 업적을 입력하세요.");
		String inputAchievement = sc.nextLine();
		
		hpStream.map(hp -> 
			hp.getPerInfo(inputAchievement))
				.forEach(hp -> {
				if(hp != null) {
					System.out.println(hp.getName() + ", " 
				+ hp.getAchivement() + ", " + hp.getCountry());
				}
			});
		
		hpStream = hpList.stream();
		
		System.out.println("검색할 나라를 입력하세요.");
		String inputConutry = sc.nextLine();
		
		hpStream.filter(hp -> 
			hp.getSameCountryPerson(inputConutry))
				.forEach(hp -> System.out.println(hp.getName()
						+ ", " + hp.getAchivement() + ", "
						+ hp.getCountry()));
		
		hpStream = hpList.stream();
		
		hpStream.filter(hp -> hp.getName().charAt(0) == '이')
				.forEach(hp -> System.out.println(hp.getName()
						+ ", " + hp.getAchivement() + ", "
						+ hp.getCountry()));
		
		hpStream = hpList.stream();
		
		String[] firstName = 
			{"제갈", "을지", "독고", "황보", "남궁", "동방", "선우"};
		
		hpStream.filter(hp -> {
					for(String fName : firstName) {
						if(hp.getName().contains(fName)) {
							return true;
						}
					}
					return false;
				})
				.forEach(hp -> System.out.println(hp.getName()
						+ ", " + hp.getAchivement() + ", "
						+ hp.getCountry()));
		
		
		
		
		
		
		
		
		
					
		
		
		sc.close();
	}

}
