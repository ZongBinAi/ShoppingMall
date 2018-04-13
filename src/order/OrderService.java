package order;

import org.springframework.transaction.annotation.Transactional;
import user.User;
import utils.PageBean;

import java.util.List;

/**
 * 业务层订单
 */
@Transactional
public class OrderService {
    //注入dao
    private OrderDao orderDao;
    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    /**
     * 保存订单
     * @param order
     */
    public Integer save(Order order) {
        return orderDao.save(order);
    }

    /**
     * 根据订单id查询订单
     * @param oid   订单id
     * @return
     */
    public Order findByOid(Integer oid) {
        return orderDao.findByOid(oid);
    }

    /**
     * 修改订单
     * @param currOrder
     */
    public void update(Order currOrder) {
        orderDao.update(currOrder);
    }

    /**
     * 按用户id查询订单（head中我的订单）
     * @param existUser 持有id的用户
     * @return
     */
    public List<Order> findByUid(User existUser) {
        return orderDao.findByUid(existUser);
    }

    /**
     * 后台按状态查询订单（带分页）
     * @param state 状态
     * @param page  当前页
     * @return
     */
    public PageBean<Order> findByPage(Integer state, Integer page) {
        PageBean<Order> pageBean=new PageBean<Order>();
        //封装分页类
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示记录数
        Integer limit=10;
        pageBean.setLimit(limit);
        //设置总记录数
        Integer totalCount=orderDao.findCount(state);
        pageBean.setTotalCount(totalCount);
        //设置总的页数
        Integer totalPage=0;
        if (totalCount % limit == 0) {
            totalPage=totalCount/limit;
        }else {
            totalPage=totalCount/limit+1;
        }
        pageBean.setTotalPage(totalPage);
        //设置每页显示的数据
        Integer begin=(page-1)*limit;
        List<Order> list=orderDao.findByPage(state,begin,limit);
        pageBean.setList(list);

        return pageBean;
    }

    /**
     * 后台查询所有订单（带分页）
     * @param page 当前页
     * @return
     */
    public PageBean<Order> findByPage(Integer page) {
        PageBean<Order> pageBean=new PageBean<Order>();
        //封装分页类
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示记录数
        Integer limit=10;
        pageBean.setLimit(limit);
        //设置总记录数
        Integer totalCount=orderDao.findCount();
        pageBean.setTotalCount(totalCount);
        //设置总的页数
        Integer totalPage=0;
        if (totalCount % limit == 0) {
            totalPage=totalCount/limit;
        }else {
            totalPage=totalCount/limit+1;
        }
        pageBean.setTotalPage(totalPage);
        //设置每页显示的数据
        Integer begin=(page-1)*limit;
        List<Order> list=orderDao.findByPage(begin,limit);
        pageBean.setList(list);

        return pageBean;
    }
}
