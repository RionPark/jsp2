import java.util.HashMap;
import java.util.Map;

public class Test {

	String sql ="update PHONE_INFO\r\n"
			+ "set PI_NAME='갤럭시S11',\r\n"
			+ "PI_PRICE=500000,\r\n"
			+ "PI_RELEASE='20181210',\r\n"
			+ "PI_VENDOR='삼성전자'\r\n"
			+ "where PI_NUM=1";
	public static void main(String[] args) {
		Map<String,String> map = new HashMap<>();
		
		System.out.println(map.isEmpty());
		map.put("1", "1");
		System.out.println(map.isEmpty());
	}
}
