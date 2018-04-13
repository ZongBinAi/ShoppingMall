package adminuser;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import java.util.List;

/**
 * 后台用户Action
 */
public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser>{
    //模型驱动，注入adminUser
    private AdminUser adminUser=new AdminUser();
    @Override
    public AdminUser getModel() {
        return adminUser;
    }

    //接受验证码
    private String checkcode;
    public void setCheckcode(String checkcode) {
        this.checkcode = checkcode;
    }

    //注入Service
    private AdminUserService adminUserService;
    public void setAdminUserService(AdminUserService adminUserService) {
        this.adminUserService = adminUserService;
    }

    /**
     * 后台用户登陆方法
     * @return
     */
    public String login(){
        AdminUser existAdminUser= adminUserService.login(adminUser);
        String checkcode2= (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");

        if (existAdminUser == null||checkcode==null||!checkcode.equalsIgnoreCase(checkcode2)) {
            //登陆失败
            this.addActionError("用户名或密码或验证码错误！");
            return LOGIN;
        }else {
            //登陆成功
            ServletActionContext.getRequest().getSession().setAttribute("existAdminUser",existAdminUser);
            return "loginSuccess";
        }
    }


    /**
     * 后台查询所有用户
     * @return
     */
    public String adminFindAll(){
        List<AdminUser> aList= adminUserService.findAll();
        //压栈
        ActionContext.getContext().getValueStack().set("aList",aList);

        return "adminFindAllSuccess";
    }
}
