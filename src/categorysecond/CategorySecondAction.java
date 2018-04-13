package categorysecond;

import category.Category;
import category.CategoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import utils.PageBean;

import java.util.List;

/**
 * 二级分类action
 */
public class CategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond>{
    //接收页数
    private Integer page;
    public void setPage(Integer page) {
        this.page = page;
    }

    //注入Service
    private CategorySecondService categorySecondService;
    public void setCategorySecondService(CategorySecondService categorySecondService) {
        this.categorySecondService = categorySecondService;
    }

    //注入一级分类的Sercice
    private CategoryService categoryService;
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    //接收cid
    private Integer cid;
    public void setCid(Integer cid) {
        this.cid = cid;
    }

    //模型驱动
    private CategorySecond categorySecond=new CategorySecond();
    @Override
    public CategorySecond getModel() {
        return categorySecond;
    }



    /**
     * 后台查询所有二级分类（分页）
     * @return
     */
    public String adminFindAll(){
        //调用Service来完成查询
        PageBean<CategorySecond> pageBean=categorySecondService.findByPage(page);
        //压栈
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);

        return "adminFindAllSuccess";
    }

    /**
     * 后台二级分类跳转到添加页面的方法
     * @return
     */
    public String addPage(){
        //查询一级分类的列表
        List<Category> cList=categoryService.findAll();
        //压栈
        ActionContext.getContext().getValueStack().set("cList",cList);

        return "addPageSuccess";
    }

    /**
     *后台 二级分类保存操作
     * @return
     */
    public String save(){
        Category category=new Category();
        category.setCid(cid);

        categorySecond.setCategory(category);

        categorySecondService.save(categorySecond);

        return "saveSuccess";
    }

    /**
     * 后台删除二级分类
     * @return
     */
    public String delete(){
        categorySecondService.delete(categorySecond);
        return "deleteSuccess";
    }

    /**
     * 后台编辑（查询）二级分类
     * @return
     */
    public String edit(){
        //查询一级分类的列表
        List<Category> cList=categoryService.findAll();
        //压栈
        ActionContext.getContext().getValueStack().set("cList",cList);

        categorySecond=categorySecondService.findByCsid(categorySecond.getCsid());
        return "editSuccess";
    }

    /**
     * 后台修改二级分类
     * @return
     */
    public String update(){
        Category category=new Category();
        category.setCid(cid);

        categorySecond.setCategory(category);

        categorySecondService.update(categorySecond);

        return "updateSuccess";
    }
}
