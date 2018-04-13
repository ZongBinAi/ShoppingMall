package product;

import org.springframework.transaction.annotation.Transactional;
import utils.PageBean;

import java.util.List;

/**
 * 商品业务层
 */
@Transactional
public class ProductService {
    //注入dao
    private ProductDao productDao;
    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    /**
     * 查询热门商品
     * @return
     */
    public List<Product> findHot() {
        return productDao.findHot();
    }


    /**
     * 查询最新商品
     * @return
     */
    public List<Product> findNew() {
        return productDao.findNew();
    }

    /**
     * 分类显示商品方法（分页）
     * @param cid  一级分类id，用于查询
     * @param page 当前页数
     * @return
     */
    public PageBean<Product> findByPage(Integer cid, Integer page) {
        PageBean<Product> pageBean= new PageBean<Product>();
        int limit=20;//每页显示记录数
        int totalPage=0;//总页数

        pageBean.setPage(page);
        pageBean.setLimit(limit);

        //查询总的记录数
        Integer totalCount=productDao.findCountByCid(cid);
        pageBean.setTotalCount(totalCount);

        //总页数的封装
        if (totalCount % limit == 0) {
            totalPage=totalCount/limit;
        }else {
            totalPage=totalCount/limit+1;
        }
        pageBean.setTotalPage(totalPage);

        //商品数据集合
        int begin=(page-1)*limit;
        List<Product> list=productDao.findByPage(cid,begin,limit);
        pageBean.setList(list);

        return pageBean;
    }

    /**
     * 业务层查询商品详情方法
     * @param pid   商品id
     * @return
     */
    public Product findByPid(Integer pid) {
        return productDao.findByPid(pid);
    }

    /**
     * 业务层根据二级分类id查询商品
     *
     * @param csid  二级分类id
     * @param page 当前页数
     * @return
     */
    public PageBean<Product> findByCsid(Integer csid,Integer page) {
        PageBean<Product> pageBean= new PageBean<Product>();
        int limit=20;//每页显示记录数
        int totalPage=0;//总页数

        pageBean.setPage(page);
        pageBean.setLimit(limit);

        //总记录数
        Integer totalCount=productDao.findByCsid(csid);
        pageBean.setTotalCount(totalCount);

        //计算总的页数
        if (totalCount % limit == 0) {
            totalPage=totalCount/limit;
        }else {
            totalPage=totalCount/limit+1;
        }
        pageBean.setTotalPage(totalPage);

        //数据的集合
        int begin=(page-1)*limit;
        List<Product> list=productDao.findByPageCsid(csid,begin,limit);

        pageBean.setList(list);

        return pageBean;
    }

    /**
     * 后台查询所有商品带有分页
     * @param page 当前页
     * @return
     */
    public PageBean<Product> findByPage(Integer page) {
        //封装pageBean对象
        PageBean<Product> pageBean= new PageBean<Product>();
        int limit=10;//每页显示记录数

        pageBean.setPage(page);
        pageBean.setLimit(limit);

        //总记录数
        int totalCount=productDao.findCount();
        pageBean.setTotalCount(totalCount);

        int totalPage=0;//总页数
        if (totalCount % limit == 0) {
            totalPage=totalCount/limit;
        }else {
            totalPage=totalCount/limit+1;
        }
        pageBean.setTotalPage(totalPage);

        //每页显示数据集合
        int begin=(page-1)*limit;
        List<Product> list=productDao.findByPage(begin,limit);

        pageBean.setList(list);

        return pageBean;
    }

    /**
     * 后台保存商品
     * @param product 商品
     */
    public void save(Product product) {
        productDao.save(product);
    }

    /**
     * 后台删除商品
     * @param product
     */
    public void delete(Product product) {
        productDao.delete(product);
    }

    /**
     * 后台修改商品
     * @param product
     */
    public void update(Product product) {
        productDao.update(product);
    }
}
