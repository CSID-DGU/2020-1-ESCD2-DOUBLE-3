package zx9.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import chain.Util;
import pwchange.bouncy_change;
import zx9.web.vo.BankVO;
import zx9.web.vo.BlistVO;

@Repository
public class BlistDaoImpl implements BlistDao {

	@Autowired
	private SqlSession sqlSession;// 자동 의존성 주입 => mybatis쿼리문 수행객체

	
	bouncy_change crt = new bouncy_change();
	@Override
	public List<List<BlistVO>> blockchain(String bid) {
		List<BlistVO>bl=sqlSession.selectList("blockchain",bid);
		List<BlistVO>bldiff=sqlSession.selectList("blockchain_diff",bid);
		int l=bl.size();
		System.out.println("리스트 크기 :"+l);
		Integer a;
		Integer b;
		String prehash;
		String thishash;
		//BlistVO blv = new BlistVO();
		List<BlistVO>pbl1=new ArrayList<>();
		List<BlistVO>pbl2=new ArrayList<>();
		List<BlistVO>pbl3=new ArrayList<>();
		List<List<BlistVO>>result=new ArrayList<>();
		//해커가 순수하게 데이터만 바꾸고 해시는 변경하지 않은 경우
		//1차적 검증 = thishash다시 계산해서 비교해 보기
		for(int i=0;i<l;i++) {
			a=bl.get(i).getBinout();
			b=bl.get(i).getBrest();
			prehash=bl.get(i).getPrehash();
		
		thishash=bl.get(i).getBmemo()+bl.get(i).getBuser()+a.toString()+b.toString()+prehash;
		thishash=Util.getHash(thishash);
		if(thishash.equals(bl.get(i).getThishash())) {
			
		
		}else {	
			pbl1.add(bl.get(i));
		
		}
		
		
		
		// 해커가 특정 칼럼의 데이터와 해쉬를 변경하여 특정 칼럼에 대해서는 결함이 없는 경우
		//2차 검증 = 지금pre==이전this인지
		if(i<l-1) {
		if(prehash.equals(bl.get(i+1).getThishash())) {
			
		}else {
			pbl2.add(bl.get(i));
			pbl2.add(bl.get(i+1));
			
			
		}
		}
		//3차 검증 다른 블록체인 들과 같은지를 보자
		if(!(bl.get(i).getThishash().equals(bldiff.get(i).getThishash()))) {
			pbl3.add(bl.get(i));
		}
		
		
		
		
		
		}
		
		result.add(pbl1);
		result.add(pbl2);
		result.add(pbl3);
		return result;
		
		
	}

	@Override
	public void update_rest(BlistVO blv, BankVO bv) {
		// TODO Auto-generated method stub
		blv.setBrest(bv.getBrest());
		blv.setBid(bv.getBid());
		//blv.setPrehash(prehash);
		
		int bsequence=sqlSession.selectOne("selectseq",blv);
		blv.setBsequence(bsequence);
		BlistVO newblvo=sqlSession.selectOne("selectseqall",blv);

		if(newblvo!=null) {
			Integer a=newblvo.getBinout();
			Integer b=newblvo.getBrest();
		String prehash=newblvo.getBmemo()+newblvo.getBuser()+a.toString()+b.toString();
		System.out.println("pre :!!!"+newblvo.getBmemo()+","+newblvo.getBuser()+","+a.toString()+","+b.toString());
		System.out.println("pre : "+prehash);
		if(newblvo.getPrehash()!=null) {
				prehash+=newblvo.getPrehash();
				//System.out.println(prehash);
				System.out.println(newblvo.getPrehash());
			}
		blv.setPrehash(Util.getHash(prehash));
		}
		
		
		System.out.println(blv.getPrehash());
		
		
		
		Integer a=blv.getBinout();
		Integer b=blv.getBrest();
		String thishash=blv.getBmemo()+blv.getBuser()+a.toString()+b.toString();

		System.out.println("this:!!! "+blv.getBmemo()+","+blv.getBuser()+","+a.toString()+","+b.toString());
		System.out.println("this :"+thishash);
		if(blv.getPrehash()!=null) {
		 thishash+=blv.getPrehash();
		 System.out.println(blv.getPrehash());
		// System.out.println(thishash);
		}
	
		blv.setThishash(Util.getHash(thishash));
		
		System.out.println(blv.getThishash());
		
		
		sqlSession.update("update_Blrest",blv);//insert임
		sqlSession.insert("update_Blrest_diff",blv);
	}



	@Override
	public List<BlistVO> select_list(BlistVO bl) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("select_list", bl);

	}



	@Override
	public int getCount(String bid) {
		// TODO Auto-generated method stu
		
		return sqlSession.selectOne("getlistC",bid);
	}
	@Override
	public void sendmsg(BlistVO blv) {
		// TODO Auto-generated method stub
		sqlSession.insert("sendmsg",blv);
		
		
		
	}



	@Override
	public void fileio(BlistVO blvo) {
		// TODO Auto-generated method stub
		sqlSession.update("fileupload_bank",blvo);
	}



	@Override
	public List<String> selectallfile() {
		// TODO Auto-generated method stub

		return sqlSession.selectList("fileselect");
	}

	@Override
	public BlistVO selseq(int a) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("selseq", a);
	}





	

}
