package order;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import user.User;
import utils.PageHibernateCallback;

import java.util.List;

/**
 * dao层订单
 */
public class OrderDao extends HibernateDaoSupport{
    /**
     * 保存订单
     * @param order
     */
    public Integer save(Order order) {
        Integer oid= (Integer) this.getHibernateTemplate().save(order);
        return oid;
    }

    /**
     * 根据订单id查询订单
     * @param oid   订单id
     * @return
     */
    public Order findByOid(Integer oid) {
        return this.getHibernateTemplate().get(Order.class,oid);
    }

    /**
     * 修改订单
     * @param currOrder
     */
    public void update(Order currOrder) {
        this.getHibernateTemplate().update(currOrder);
    }

    /**
     * 按用户id查询订单（head中我的订单）
     * @param existUser 持有id的用户
     * @return
     */
    public List<Order> findByUid(User existUser) {
        List<Order> list=this.getHibernateTemplate().find("from Order o where o.user.uid=? order by ordertime desc ",existUser.getUid());
        return list;
    }

    /**
     * 后台查询订单数量
     * @return
     */
    public Integer findCount() {
        List<Long> list=this.getHibernateTemplate().find("select count (*) from Order");
        return list.get(0).intValue();
    }

    /**
     * 后台查询每页显示的数据
     * @return
     * @param begin
     * @param limit
     */
    public List<Order> findByPage(Integer begin, Integer limit) {
        String hql="from Order order by ordertime desc";
        List<Order> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Order>(hql,null,begin,limit));
        return list;
    }

    /**
     * 后台按状态查询订单数量
     * @param state
     * @return
     */
    public Integer findCount(Integer state) {
        List<Long> list=this.getHibernateTemplate().find("select count (*) from Order where state=?",state);
        return list.get(0).intValue();
    }

    /**
     * 后台按状态查询每页显示的数据
     * @param state
     * @param begin
     * @param limit
     * @return
     */
    public List<Order> findByPage(Integer state, Integer begin, Integer limit) {
        String hql="from Order where state=? order by ordertime desc";
        List<Order> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Order>(hql,new Object[]{state},begin,limit));
        return list;
    }
}
