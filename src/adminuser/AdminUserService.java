package adminuser;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 后台用户的业务层
 */
@Transactional
public class AdminUserService {
    //注入dao
    private AdminUserDao adminUserDao;
    public void setAdminUserDao(AdminUserDao adminUserDao) {
        this.adminUserDao = adminUserDao;
    }

    /**
     * 后台用户登陆方法
     * @param adminUser 后台用户
     * @return
     */
    public AdminUser login(AdminUser adminUser) {
        return adminUserDao.login(adminUser);
    }

    /**
     * 后台查询所有用户
     * @return
     */
    public List<AdminUser> findAll() {
        return adminUserDao.findAll();
    }
}
