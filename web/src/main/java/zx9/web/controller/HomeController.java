package zx9.web.controller;

import java.security.Provider;
import java.security.Security;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.salt.StringFixedSaltGenerator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chain.Util;
import pwchange.Blockchain_original;
import pwchange.Transaction_original;
import pwchange.bouncy_change;
import zx9.web.dao.BankDao;
import zx9.web.dao.UserDao;
import zx9.web.vo.BankVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	UserDao udao;
	@Autowired
	BankDao bdao;
	

	bouncy_change crt = new bouncy_change();
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping("/androidtest")
	public @ResponseBody JSONObject andr(String id,String pw) {
		System.out.println("오오ㅗ오오오오ㅗ오오");
		System.out.println(id+","+pw);
        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        List<BankVO> items = new ArrayList<>();
        JSONArray jArray = new JSONArray(); // json배열
        
        
    	for(int i=0;i<10;i++) {
    		BankVO vo=new BankVO();
			vo.setBid(""+i);
			vo.setBname("세종");
		
			items.add(vo);
		}
    	
    	
        for(int i=0; i<items.size(); i++){
        	BankVO dto = items.get(i);
            JSONObject row = new JSONObject();
            // json객체.put("변수명",값)
       
            row.put("f", dto.getBid());
            row.put("l", dto.getBname());
      
            // 배열에 추가
            // json배열.add(인덱스,json객체)
            jArray.add(i,row);
        }
        // json객체에 배열을 넣음
        jsonMain.put("sendData", jArray);
        return jsonMain;
	}
	@RequestMapping("/andtest")
	public @ResponseBody JSONObject andtest(String id,String pw) {
		System.out.println("getpw");
		System.out.println(id);System.out.println(pw);
			 JSONObject jsonMain = new JSONObject(); // json 
			 String pwd="Abdeok odielswo dj244 d";
			 jsonMain.put("Bpw", pwd);
			 jsonMain.put("Bid","hihello");
			// System.out.println(pwd);		 
			return jsonMain;
	
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		System.out.println("hello");
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping("/test")
	public void test() {
	
		
		Security.addProvider(new BouncyCastleProvider());
		//PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor(); 
		//encryptor.setPassword("somePassword"); encryptor.setAlgorithm("PBEWITHSHA256AND128BITAES-CBC-BC");

		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor(); 
		encryptor.setPassword("somePassword"); encryptor.setAlgorithm("PBEWithMD5AndDES");
		String str = "testString"; String encStr = encryptor.encrypt(str); String decStr = encryptor.decrypt(encStr);
		//System.out.println("str :"+str+", encStr : "+encStr+" decStr :"+decStr);
//����� ���ට���� encStr�� ��ӹٲ�°� Ȯ�� �߰�...
		
		StandardPBEStringEncryptor encryptor2 = new StandardPBEStringEncryptor(); 
		encryptor2.setPassword("somePassword"); encryptor2.setAlgorithm("PBEWithMD5AndDES");
		encryptor2.setSaltGenerator(new StringFixedSaltGenerator("someFixedSalt"));
		 str = "testString";  encStr = encryptor2.encrypt(str);  decStr = encryptor2.decrypt(encStr);
	//	System.out.println("str :"+str+", encStr : "+encStr+" decStr :"+decStr);

		/*
		 * ��°��
		 * 
		str :testString, encStr : iRy3EI7x+o+ignCLGHZUvBcJku0bX8H6 decStr :testString
		str :testString, encStr : rEMYziBW/rGyMTc3ppqmUw== decStr :testString
		
		str :testString, encStr : Bh5jTX6TaXzDn5mXBwcbh2kKqEXEPWS6 decStr :testString
		str :testString, encStr : rEMYziBW/rGyMTc3ppqmUw== decStr :testString
		 * 
		 *
		 * */
		
		
		//��¥ bouncy ���
		
		

		
		
		PooledPBEStringEncryptor boun = new PooledPBEStringEncryptor(); 
		boun.setProvider(new BouncyCastleProvider()); 
		boun.setPassword("somePassword"); 
		boun.setAlgorithm("PBEWITHSHA256AND128BITAES-CBC-BC");		 
		boun.setPoolSize(5);
		 str = "testString";  encStr = boun.encrypt(str);  decStr = boun.decrypt(encStr);
		System.out.println("str :"+str+", encStr : "+encStr+" decStr :"+decStr);
		
		
		
		
		
		//�굵 ��µǴ°� ��� �ٲ�
		
		System.out.println("hi");
		Provider provider = Security.getProvider("BC");
		  if (provider != null){
		   System.out.println("Bouncy Castle provider is available");
		   System.out.println(provider.getInfo());
		  } else {
		   System.out.println("Bouncy Castle provider is NOT available");
		  }
		  
		
	}
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model m,BankVO b) {
		HttpSession session=request.getSession();
		System.out.println("session id : "+session.getAttribute("Sid"));
		if(session.getAttribute("Sid")!=null) {
			m.addAttribute("Sid", session.getAttribute("Sid"));
			m.addAttribute("Sgrade", session.getAttribute("Sgrade"));
			m.addAttribute("Siscouncil", session.getAttribute("Siscouncil"));
			m.addAttribute("Smajor", session.getAttribute("Smajor"));
			m.addAttribute("Sname", session.getAttribute("Sname"));
			m.addAttribute("Snum", session.getAttribute("Snum"));
			System.out.println(session.getAttribute("Sid"));
		//	if(Integer.parseInt(session.getAttribute("Siscouncil").toString())!=0) {
				b=bdao.select_bank(session.getAttribute("Smajor").toString());
				
				m.addAttribute("bank", b);
		//	}
		}
		
		
		
		
		
		return "template/index";
	}
	@RequestMapping("/a")
	public String instructor() {

    	System.out.println("HASH 224 : " + crt.CryptoSHA3("1234", 256));//bank
    	System.out.println("HASH 224 : " + crt.CryptoSHA3("1234", 384));//bank
    	System.out.println("HASH 224 : " + crt.CryptoSHA3("아빠", 224));//user
	//	System.out.println("HASH 256 : " + crt.CryptoSHA3("가나다라마바", 256));
	//	System.out.println("HASH 384 : " + crt.CryptoSHA3("가나다라마바", 384));
	//	System.out.println("HASH 512 : " + crt.CryptoSHA3("가나다라마바", 512));
		return "template/a";
	}
	@RequestMapping("/block")
	public String lecture() {
		
		
		
		Blockchain_original block=new Blockchain_original(1,null,0,new ArrayList());
		block.mine();
		block.getinfo(); 
		Blockchain_original block2=new Blockchain_original(2,block.getBlockHash(),0,new ArrayList());
		block2.addTransaction(new Transaction_original("staris","hama",1.5));
		block2.addTransaction(new Transaction_original("시은","hama",0.7));
		
		block2.mine();
		block2.getinfo();
		Blockchain_original block3=new Blockchain_original(3,block2.getBlockHash(),0,new ArrayList());
		block3.addTransaction(new Transaction_original("가경","시은",8.2));
		block3.addTransaction(new Transaction_original("hama","staris",0.4));
		
		
		block3.mine();
		block3.getinfo();
		Blockchain_original block4=new Blockchain_original(4,block3.getBlockHash(),0,new ArrayList());
		block4.addTransaction(new Transaction_original("시은","staris",0.1));
		
		block4.mine();
		block4.getinfo();
		
		
		return "template/b";
	}

}
