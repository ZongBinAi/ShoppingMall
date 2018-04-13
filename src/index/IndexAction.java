package index;

import category.Category;
import category.CategoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import product.Product;
import product.ProductService;

import java.util.List;

/**
 * 首页访问的Action
 */
public class IndexAction extends ActionSupport{
    //注入一级分类的Service
    private CategoryService categoryService;
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    //注入商品的Service
    private ProductService productService;
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    //热门商品集合:提供get方法，自动压栈
    private List<Product> hotList;
    public List<Product> getHotList() {
        return hotList;
    }

    //最新商品集合:提供get方法，自动压栈
    private List<Product> newList;
    public List<Product> getNewList() {
        return newList;
    }

    @Override
    /**
     * 执行首页访问的方法
     */
    public String execute() throws Exception {
        //查询所有一级分类
        List<Category> categoryList=categoryService.findAll();
        //存到Session
        ActionContext.getContext().getSession().put("categoryList",categoryList);

        //查询热门商品，为hotlist提供getter方法，自动压栈
        hotList = productService.findHot();

        //查询最新商品，为newlist提供getter方法，自动压栈
        newList=productService.findNew();

        return "indexSuccess";
    }

    /**
     * 显卡天梯图
     * @return
     */
    public String graLaDi(){
        return "graLaDiSuccess";
    }

    /**
     * 商务配置
     * @return
     */
    public String businOff(){
        return "businOffSuccess";
    }

    /**
     * 家用娱乐
     * @return
     */
    public String homeEnj(){
        return "homeEnjSuccess";
    }

    /**
     * 游戏发烧
     * @return
     */
    public String gamePower(){
        return "gamePowerSuccss";
    }

    /**
     * 专业办公
     * @return
     */
    public String profeDes(){
        return "profeDesSuccess";
    }

    /**
     * 豪华配置
     * @return
     */
    public String EX(){
        return "EXSuccess";
    }

    /**
     * 极简配置
     * @return
     */
    public String simple(){
        return "simpleSuccess";
    }
}
