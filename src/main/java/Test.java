import java.util.HashMap;
import java.util.Map;

public class Test {

	String sql ="select UI_NUM, UI_NAME, UI_AGE, UI_ID, \r\n"
			+ "UI_PWD, UI_PHONE, UI_ADDRESS, UI_TRANS\r\n"
			+ "from USER_INFO"
	public static void main(String[] args) {
		Map<String,String> map = new HashMap<>();
		
		System.out.println(map.isEmpty());
		map.put("1", "1");
		System.out.println(map.isEmpty());
	}
}
