package user;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户的Action
 */
public class UserAction extends ActionSupport implements ModelDriven<User>{
    //Struts2中的模型驱动使用类
    private User user=new User();
    @Override
    public User getModel() {
        return user;
    }

    //注入userService
    private UserService userService;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    //接受验证码
    private String checkcode;
    public void setCheckcode(String checkcode) {
        this.checkcode = checkcode;
    }

    /**
     * 编写一个跳转到注册页面的方法
     */
    public String registPage(){
        return "registPageSuccess";
    }

    /**
     * 前台：注册用户方法
     * @return
     */
    @InputConfig(resultName = "registInput")        //因为在struts.xml中之配置了一个校验错误的input跳转，注册和登陆都要往那里跳，所以这里设置标识
    public String regist(){
        //从session中获得存验证码
        String checkcode1= (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
        if (checkcode==null||!checkcode.equalsIgnoreCase(checkcode1)){
            this.addActionError("验证码错误！");
            return "registInput";
        }
        userService.regist(user);
        this.addActionMessage("注册成功！");

        return "registSuccess";
    }

    /**
     * 前台：跳转到登陆界面
     * @return
     */
    public String loginPage(){
        return "loginPageSuccess";
    }

    /**
     * 前台：登陆功能
     * @return
     */
    @InputConfig(resultName = "loginInput")
    public String login(){
        //从session中获得存验证码
        String checkcode2= (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
        if (checkcode==null||!checkcode.equalsIgnoreCase(checkcode2)){
            this.addActionError("验证码错误！");
            return "loginInput";
        }
        User existUser=userService.login(user);
        if (existUser == null) {
            //登陆失败
            this.addActionError("用户名或密码错误或账户未激活");
            return "loginInput";
        }else {
            ServletActionContext.getRequest().getSession().setAttribute("existUser",existUser);
            return "loginSuccess";
        }
    }


    /**
     * 前提：注册ajax检验用户名
     */
    public void checkUserName() throws IOException {
        User existUser=userService.findByUserName(user.getUsername());
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        if (existUser == null) {
            //用户名可以使用
            response.getWriter().print("<font color='green'>用户名可以使用</font>");
        }else {
            //用户名已存在
            response.getWriter().print("<font color='red'>用户名已被注册</font>");
        }
    }

    /**
     * 用户退出
     * @return
     */
    public String quit(){
        //获得用户Session并销毁
        ServletActionContext.getRequest().getSession().invalidate();
        return "quitSuccess";
    }

}
