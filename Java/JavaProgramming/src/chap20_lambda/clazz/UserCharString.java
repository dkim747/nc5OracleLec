package chap20_lambda.clazz;
import java.util.stream.BaseStream;
public class UserCharString {
	private String str;

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}
	
	public UserCharString(String str) {
		this.str = str;
	}
	
	//함수형 인터페이스를 매개변수로 갖는 메소드가 호출되는 부분에서
	//함수형 인터페이스를 람다식으로 구현한다.
	public void changeStr(char ch, UserChar uc) {
		this.str = uc.findUserChar(ch, this.str);
	}

	@Override
	public String toString() {
		return "UserCharString [str=" + str + "]";
	}
}
