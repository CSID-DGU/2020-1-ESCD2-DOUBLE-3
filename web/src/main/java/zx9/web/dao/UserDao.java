package zx9.web.dao;

import zx9.web.vo.UserVO;

public interface UserDao {

	void register(UserVO a);

	boolean login(UserVO a);

	UserVO getall(UserVO a);

}