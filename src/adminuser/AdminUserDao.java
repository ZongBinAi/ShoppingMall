package adminuser;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * 后台用户dao层
 */
public class AdminUserDao extends HibernateDaoSupport{
    /**
     * 后台用户登陆方法
     * @param adminUser 后台用户
     * @return
     */
    public AdminUser login(AdminUser adminUser) {
        List<AdminUser> list=this.getHibernateTemplate().find("from AdminUser where username=? and password=?",adminUser.getUsername(),adminUser.getPassword());
        if (list != null &&list.size()!=0) {
            return list.get(0);
        }
        return null;
    }

    /**
     * 后台查询所有用户方法
     * @return
     */
    public List<AdminUser> findAll() {
        List<AdminUser> list=this.getHibernateTemplate().find("from AdminUser");
        return list;
    }
}
