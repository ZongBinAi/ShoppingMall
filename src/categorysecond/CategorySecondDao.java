package categorysecond;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import utils.PageHibernateCallback;

import java.util.List;

/**
 * 二级分类dao层
 */
public class CategorySecondDao extends HibernateDaoSupport{
    /**
     * 后台查询二级分类总数
     * @return
     */
    public Integer findCount() {
        List<Long> list=this.getHibernateTemplate().find("select count(*) from CategorySecond");
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return null;
    }

    /**
     * 后台进行分页查询二级分类
     * @param begin 开始记录
     * @param limit 每页条数
     * @return
     */
    public List<CategorySecond> findByPage(Integer begin, Integer limit) {
        String hql="from CategorySecond";
        List<CategorySecond> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<CategorySecond>(hql,null,begin,limit));
        if (list.size() > 0) {
            return list;
        }
        return null;
    }

    /**
     * 后台保存二级分类
     * @param categorySecond
     */
    public void save(CategorySecond categorySecond) {
        this.getHibernateTemplate().save(categorySecond);
    }

    /**
     * 后台删除二级分类
     * @param categorySecond
     */
    public void delete(CategorySecond categorySecond) {
        this.getHibernateTemplate().delete(categorySecond);
    }

    /**
     * 后台查询二级分类
     * @param csid 二级分类id
     * @return
     */
    public CategorySecond findByCsid(Integer csid) {
        return this.getHibernateTemplate().get(CategorySecond.class,csid);
    }

    /**
     * 修改二级分类
     * @param categorySecond
     */
    public void update(CategorySecond categorySecond) {
        this.getHibernateTemplate().update(categorySecond);
    }

    /**
     * 后台查询所有的二级分类
     * @return
     */
    public List<CategorySecond> findAll() {
        return this.getHibernateTemplate().find("from CategorySecond");
    }
}
