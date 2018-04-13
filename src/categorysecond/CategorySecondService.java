package categorysecond;

import org.springframework.transaction.annotation.Transactional;
import utils.PageBean;

import java.util.List;

/**
 * 二级分类业务层
 */
@Transactional
public class CategorySecondService {
    //注入dao
    private CategorySecondDao categorySecondDao;
    public void setCategorySecondDao(CategorySecondDao categorySecondDao) {
        this.categorySecondDao = categorySecondDao;
    }


    /**
     * 后台带有分页查询所有二级分类
     * @param page 页数
     * @return
     */
    public PageBean<CategorySecond> findByPage(Integer page) {
        //封装pageBean
        PageBean<CategorySecond> pageBean=new PageBean<CategorySecond>();
        Integer limit=10;

        //封装页数
        pageBean.setPage(page);
        pageBean.setLimit(limit);

        //封装总数
        Integer totalCount=categorySecondDao.findCount();
        pageBean.setTotalCount(totalCount);

        Integer totalPage=0;
        if (totalCount % limit == 0) {
            totalPage=totalCount/limit;
        }else {
            totalPage=totalCount/limit+1;
        }
        pageBean.setTotalPage(totalPage);

        //每页显示的数据
        Integer begin=(page-1)*limit;
        List<CategorySecond> list=categorySecondDao.findByPage(begin,limit);
        pageBean.setList(list);

        return pageBean;
    }

    /**
     * 后台保存二级分类
     * @param categorySecond
     */
    public void save(CategorySecond categorySecond){
        categorySecondDao.save(categorySecond);
    }

    /**
     * 后台删除二级分类
     * @param categorySecond
     */
    public void delete(CategorySecond categorySecond) {
        categorySecondDao.delete(categorySecond);
    }

    /**
     * 后台查询二级分类
     * @param csid 二级分类id
     * @return
     */
    public CategorySecond findByCsid(Integer csid) {
        return categorySecondDao.findByCsid(csid);
    }

    /**
     * 后台修改二级分类
     * @param categorySecond
     */
    public void update(CategorySecond categorySecond) {
        categorySecondDao.update(categorySecond);
    }

    /**
     * 后台查询所有的二级分类
     * @return
     */
    public List<CategorySecond> findAll() {
        return categorySecondDao.findAll();
    }
}
