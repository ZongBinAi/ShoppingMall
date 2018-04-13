package category;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 一级分类业务层
 */
@Transactional
public class CategoryService {
    //注入DAO
    private CategoryDao categoryDao;
    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    /**
     * 业务层查询所有的一级分类的方法
     * @return
     */
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    /**
     * 保存一级分类
     * @param category
     */
    public void save(Category category) {
        categoryDao.save(category);
    }

    /**
     * 删除一级分类
     * @param category
     */
    public void delete(Category category) {
        categoryDao.delete(category);
    }

    /**
     * 根据一级分类id查询以及分类
     * @param cid 一级分类id
     * @return
     */
    public Category findByCid(Integer cid) {
        return categoryDao.findByCid(cid);
    }

    /**
     * 修改一级分类
     * @param category
     */
    public void update(Category category) {
        categoryDao.update(category);
    }
}
