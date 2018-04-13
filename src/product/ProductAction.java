package product;

import category.Category;
import category.CategoryService;
import categorysecond.CategorySecond;
import categorysecond.CategorySecondService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import utils.PageBean;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 商品类Action
 */
public class ProductAction extends ActionSupport implements ModelDriven<Product>{
    //接收cid
    private Integer cid;
    public Integer getCid() {
        return cid;
    }
    public void setCid(Integer cid) {
        this.cid = cid;
    }

    //注入一级分类的Service,用于查询所有一级分类
    private CategoryService categoryService;
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    //接受当前页数
    private Integer page;
    public void setPage(Integer page) {
        this.page = page;
    }

    //注入商品的Service
    private ProductService productService;
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    //分页商品显示,提供getter方法，默认压入值栈
    private PageBean<Product> pageBean;
    public PageBean<Product> getPageBean() {
        return pageBean;
    }

    //模型驱动类
    private Product product=new Product();
    @Override
    public Product getModel() {
        return product;
    }

    //接收二级分类id
    private Integer csid;
    public Integer getCsid() {
        return csid;
    }
    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    //注入二级分类的Service
    private CategorySecondService categorySecondService;
    public void setCategorySecondService(CategorySecondService categorySecondService) {
        this.categorySecondService = categorySecondService;
    }

    //文件上传需要的三个属性
    private File upload;//上传文件
    private String uploadContentType;   //上传文件MIME类型
    private String uploadFileName;  //上传文件名称
    public void setUpload(File upload) {
        this.upload = upload;
    }
    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }
    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    /**
     * 查询商品
     * @return
     */
    public String findByCid(){
        //查询分类：
        //查询所有一级分类
        List<Category> categoryList= categoryService.findAll();
        //采用压栈的方式将catagoryList压入值栈
        //获得值栈
        ActionContext.getContext().getValueStack().set("categoryList",categoryList);

        //查询商品：
        //分页查询
        pageBean=productService.findByPage(cid,page);

        return "findByCidSuccess";
    }

    /**
     * 商品详情
     * @return
     */
    public String findByPid(){
        //查询所有一级分类
        List<Category> categoryList= categoryService.findAll();
        //采用压栈的方式将catagoryList压入值栈
        //获得值栈
        ActionContext.getContext().getValueStack().set("categoryList",categoryList);

        product=productService.findByPid(product.getPid());

        return "findByPidSuccess";
    }

    /**
     * 查询二级分类商品
     * @return
     */
    public String findByCsid(){
        //查询所有一级分类
        List<Category> categoryList= categoryService.findAll();
        //采用压栈的方式将catagoryList压入值栈
        //获得值栈
        ActionContext.getContext().getValueStack().set("categoryList",categoryList);

        pageBean=productService.findByCsid(csid,page);
        return "findByCsidSuccess";
    }


    /**
     *后台查询所有商品的方法
     * @return
     */
    public String adminFindAll(){
        pageBean= productService.findByPage(page);

        return "adminFindAllSuccess";
    }


    /**
     * 后台跳转到添加页面
     * @return
     */
    public String addPage(){
        //查询所有的二级分类
        List<CategorySecond> csList=categorySecondService.findAll();
        //压栈
        ActionContext.getContext().getValueStack().set("csList",csList);

        return "addPageSuccess";
    }

    /**
     * 后台保存商品（同时上传图片）
     * @return
     */
    public String save() throws IOException {
        //文件上传
        //获得上传路径
        String path=ServletActionContext.getServletContext().getRealPath("/products");
        String realPath=path+"/1/"+getUpSubName(csid)+"/"+uploadFileName;

        File diskFile=new File(realPath);

        //文件上传
        FileUtils.copyFile(upload,diskFile);

        //保存到数据库
        //设置二级分类
        CategorySecond categorySecond=new CategorySecond();
        categorySecond.setCsid(csid);
        product.setCategorySecond(categorySecond);

        //设置时间
        product.setPdate(new Date());

        //设置图片上传的路径
        product.setImage("products/1/"+getUpSubName(csid)+"/"+uploadFileName);

        //调用service保存商品
        productService.save(product);

        return "saveSuccess";
    }

    /**
     * 后台删除商品
     * @return
     */
    public String delete(){
        productService.delete(product);
        return "deleteSuccess";
    }

    /**
     * 后台编辑（查询）商品
     * @return
     */
    public String edit(){
        //查询所有的二级分类
        List<CategorySecond> csList=categorySecondService.findAll();
        //压栈
        ActionContext.getContext().getValueStack().set("csList",csList);

        product=productService.findByPid(product.getPid());

        return "editSuccess";
    }

    /**
     * 后台修改二级分类
     * @return
     */
    public String update() throws IOException {
        CategorySecond categorySecond=new CategorySecond();
        categorySecond.setCsid(csid);

        product.setCategorySecond(categorySecond);

        //设置时间
        product.setPdate(new Date());

        productService.update(product);

        return "updateSuccess";
    }

    /**
     * 得到上传文件所属分类文件加名字
     * @return
     */
    public String getUpSubName(Integer csid){
        if (csid >= 1 && csid <= 2) {
            return "CPU";
        } else if (csid >= 3 && csid <= 8) {
            return "boardcard";
        } else if (csid >= 9 && csid <= 14) {
            return "internal_storage";
        } else if (csid >= 15 && csid <= 19) {
            return "hard_dick";
        } else if (csid >= 20 && csid <= 25) {
            return "SSD";
        } else if (csid >= 26 && csid <= 31) {
            return "G_card";
        } else if (csid >= 32 && csid <= 35) {
            return "crate";
        } else if (csid >= 36 && csid <= 41) {
            return "monitor";
        } else if (csid >= 42 && csid <= 45) {
            return "power";
        } else if (csid >= 46 && csid <= 47) {
            return "cooler";
        } else if (csid >= 48 && csid <= 51) {
            return "mouse";
        } else if (csid >= 52 && csid <= 55) {
            return "keyboard";
        }else {
            return csid.toString();
        }
    }
}
