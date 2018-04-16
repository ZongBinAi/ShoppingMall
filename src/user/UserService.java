package user;

import org.springframework.transaction.annotation.Transactional;
import utils.UUIDUtils;

/**
 * 用户模块业务层代码
 */
@Transactional
public class UserService {
    //注入Dao
    private UserDao userDao;
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }


    /**
     * 业务层注册用户代码
     * @param user 用户
     */
    public void regist(User user){
        //保存用户：
        user.setState(1);   //0:未激活     1：激活
        //设置激活码
        String code= UUIDUtils.getUUID();
        user.setCode(code);
        //保存用户
        userDao.save(user);
    }

    /**
     * 业务层根据激活码查询用户
     * @param code
     * @return
     */
    public User findByCode(String code){
        return userDao.findByCode(code);
    }

    /**
     * 业务层修改用户方法
     * @param existUser
     */
    public void update(User existUser){
        userDao.update(existUser);
    }

    /**
     * 业务层登陆方法
     * @param user  用户
     * @return
     */
    public User login(User user) {
        return userDao.login(user);
    }

    /**
     * 业务层按用户名查找
     * @param username
     * @return
     */
    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }
}
