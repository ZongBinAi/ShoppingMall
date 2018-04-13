package product;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import utils.PageHibernateCallback;

import java.util.List;

/**
 * 商品dao层
 */
public class ProductDao extends HibernateDaoSupport{
    /**
     * DAO层查询热门商品，只显示10个
     * @return
     */
    public List<Product> findHot() {
       /* DetachedCriteria criteria=DetachedCriteria.forClass(Product.class);
        criteria.add(Restrictions.eq("is_hot",1));
        List<Product> list=this.getHibernateTemplate().findByCriteria(criteria,0,10);*/

        List<Product> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>("from Product where is_hot=?",new Object[]{1},0,10));

        return list;
    }

    /**
     * 查询最新商品
     * @return
     */
    public List<Product> findNew() {
        List<Product> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>("from Product order by pdate desc",null,1,10));
        return list;
    }

    /**
     * 统计某个分类下的记录数
     * @param cid 一级分类id
     * @return
     */
    public Integer findCountByCid(Integer cid) {
        List<Long> list=this.getHibernateTemplate().find("select count(*) from Product p,CategorySecond cs where p.categorySecond=cs and cs.category.cid=?",cid);
        return list.get(0).intValue();
    }

    /**
     * 查询指定一级分类下的商品数据
     * @param cid   一级分类id
     * @param begin 从begin开始查
     * @param limit 每页查多少
     * @return
     */
    public List<Product> findByPage(Integer cid, int begin, int limit) {
        String hql="select p from Product p,CategorySecond cs where p.categorySecond=cs and cs.category.cid=?";
        List<Product> list =this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql,new Object[]{cid},begin,limit));
        return list;
    }

    /**
     * dao层查询商品详情
     * @param pid   商品id
     * @return
     */
    public Product findByPid(Integer pid) {
        return this.getHibernateTemplate().get(Product.class,pid);
    }

    /**
     * 统计某个二级分类下商品数量
     * @param csid 二级分类id
     * @return
     */
    public Integer findByCsid(Integer csid) {
        String hql="select count(*) from Product p join p.categorySecond cs where cs.csid=?";
        List<Long> list=this.getHibernateTemplate().find(hql,csid);

        return list.get(0).intValue();
    }

    /**
     * 查询指定二级分类下的商品
     * @param csid 二级分类id
     * @param begin 开始查的地方
     * @param limit 每页数
     * @return
     */
    public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
        String hql="select p from Product p join p.categorySecond cs where cs.csid=?";
        List<Product> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql,new Object[]{csid},begin,limit));
        return list;
    }

    /**
     * 后台查询总记录数
     * @return
     */
    public Integer findCount() {
        String hql="select count(*) from Product";
        List<Long> list=this.getHibernateTemplate().find(hql);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return null;
    }

    /**
     * 后台查询某页数据
     * @param begin
     * @param limit
     * @return
     */
    public List<Product> findByPage(int begin, int limit) {
        String hql="from Product";
        List<Product> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql,null,begin,limit));
        if (list.size() > 0) {
            return list;
        }
        return null;
    }

    /**
     * 后台保存商品
     * @param product   商品
     */
    public void save(Product product) {
        this.getHibernateTemplate().save(product);
    }

    /**
     * 后台删除商品
     * @param product
     */
    public void delete(Product product) {
        this.getHibernateTemplate().delete(product);
    }

    /**
     * 后台修改商品
     * @param product
     */
    public void update(Product product) {
        this.getHibernateTemplate().update(product);
    }
}
