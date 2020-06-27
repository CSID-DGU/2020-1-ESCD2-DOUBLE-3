package zx9.web.dao;

import java.util.List;

import zx9.web.vo.BankVO;
import zx9.web.vo.BlistVO;

public interface BankDao {

	BankVO select_bank(String Smajor);

	void update_rest(BankVO newbv);

	void deposit(BankVO bv);

	List<BankVO> GetallBank();

	void addbank(BankVO bvo);

	void addbank_list(BankVO bvo);




}
