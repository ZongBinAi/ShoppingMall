package category;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.List;

/**
 * 一级分类Action
 */
public class CategoryAction extends ActionSupport implements ModelDriven<Category>{
    //模型驱动
    private Category category=new Category();
    @Override
    public Category getModel() {
        return category;
    }

    //注入Service
    private CategoryService categoryService;
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    /**
     * 后台查询所有一级分类的方法
     * @return
     */
    public String adminFindAll(){
        List<Category> cList=categoryService.findAll();
        //压入值栈
        ActionContext.getContext().getValueStack().set("cList",cList);

        return "adminFindAllSuccess";
    }

    /**
     * 后台保存一级分类
     * @return
     */
    public String save(){
        categoryService.save(category);
        return "saveSuccess";
    }

    /**
     * 后台删除一级分类
     * @return
     */
    public String delete(){
        categoryService.delete(category);
        return "deleteSuccess";
    }

    /**
     * 后台查询一级分类
     * @return
     */
    public String edit(){
        category=categoryService.findByCid(category.getCid());
        return "editSuccess";
    }

    /**
     * 后台修改一级分类
     * @return
     */
    public String update(){
        categoryService.update(category);
        return "updateSuccess";
    }
}
