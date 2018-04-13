package category;

import com.opensymphony.xwork2.ActionContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * 一级分类DAO层
 */
public class CategoryDao extends HibernateDaoSupport{
    /**
     * DAO层查询所有一级分类的代码
     * @return
     */
    public List<Category> findAll() {
        return this.getHibernateTemplate().find("from Category");
    }

    /**
     * 添加一级分类
     * @param category
     */
    public void save(Category category) {
        this.getHibernateTemplate().save(category);
    }

    /**
     * 删除一级分类
     * @param category
     */
    public void delete(Category category) {
        category=this.getHibernateTemplate().get(Category.class,category.getCid());
        this.getHibernateTemplate().delete(category);
    }

    /**
     * 根据一级分类id查询以及分类
     * @param cid 一级分类id
     * @return
     */
    public Category findByCid(Integer cid) {
        return this.getHibernateTemplate().get(Category.class,cid);
    }

    /**
     * 修改一级分类
     * @param category
     */
    public void update(Category category) {
        this.getHibernateTemplate().update(category);
    }
}
