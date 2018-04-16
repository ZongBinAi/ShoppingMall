package order;

import cart.Cart;
import cart.CartItem;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import user.User;
import utils.PageBean;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 配置单action
 */
public class OrderAction extends ActionSupport{
    private Order order;
    public Order getOrder() {
        return order;
    }
    public void setOrder(Order order) {
        this.order = order;
    }

    //注入OrderService
    private OrderService orderService;
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    //设置支付银行
    private String pd_FrpId;
    public void setPd_FrpId(String pd_FrpId) {
        this.pd_FrpId = pd_FrpId;
    }

    //付款成功后需要的参数
    private String r6_Order;
    public void setR6_Order(String r6_Order) {
        this.r6_Order = r6_Order;
    }

    private Integer oid;
    public void setOid(Integer oid) {
        this.oid = oid;
    }

    //模型驱动2编译器出故障，这里只能使用模型驱动1
    private String name;
    private String phone;
    private String addr;

    public Integer getOid() {
        return oid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    //后台查询所需属性
    private Integer page;
    private Integer state;
    public void setPage(Integer page) {
        this.page = page;
    }
    public void setState(Integer state) {
        this.state = state;
    }

    //付款密码
    private String password;
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 从购物车页面保存订单
     * @return
     */
    public String saveOrder(){
        order = new Order();
        /****************封装订单的数据*********/
        order.setOrdertime(new Date());
        order.setState(1); // 1 未付款   2 已经付款.  3.已经发货   4 已经收货.
        // 有些数据需要从购物车中获取:
        HttpServletRequest request = ServletActionContext.getRequest();
        // 获得购物车:
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(cart == null){
            this.addActionMessage("您还没有配置单!请先去配置!");
            return "msg";
        }
        order.setTotal(cart.getTotal());
        // 订单所属的用户:
        User existUser = (User) request.getSession().getAttribute("existUser");
        if(existUser == null){
            this.addActionMessage("您还没有登录!请先去登录!");
            return "msg";
        }
        order.setUser(existUser);

        /********************封装订单项数据*************/
        // 订单项数据从 购物项的数据获得.
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setCount(cartItem.getCount());
            orderItem.setSubtotal(cartItem.getSubtotal());
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setOrder(order);

            order.getOrderItems().add(orderItem);
        }
        // 清空购物车.
        cart.clearCart();

        // 保存订单:
        Integer oid=orderService.save(order);
        order.setOid(oid);

        return "saveOrderSuccess";
    }

    /**
     * 为订单付款
     * @return
     */
    public String payOrder(){
        Order currOrder=orderService.findByOid(oid);
        currOrder.setAddr(addr);
        currOrder.setName(name);
        currOrder.setPhone(phone);

        orderService.update(currOrder);

        ActionContext.getContext().getValueStack().set("order",currOrder);
        ActionContext.getContext().getValueStack().set("pd_FrpId",pd_FrpId);

        return "paySuccess";
    }

    /**
     * 付款成功后方法
     * @return
     */
    public String callBack(){
        Order currOrder = orderService.findByOid(oid);
        ActionContext.getContext().getValueStack().set("order",currOrder);
        ActionContext.getContext().getValueStack().set("pd_FrpId",pd_FrpId);
        if (password!=null){
            User existUser=(User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
            String pwd=existUser.getPassword();
            if (pwd.equals(password)) {
                //密码正确
                this.addActionMessage("付款成功！");
                System.out.println("============"+oid+"=================");
                currOrder.setState(2);
                orderService.update(currOrder);
                return "msg";
            }else {
                //密码错误，重新输入密码
                this.addFieldError("passwordError","密码错误");
                return "paySuccess";
            }
        }
        return "paySuccess";
    }

    /**
     * 按用户id查询订单（head中我的订单）
     * @return
     */
    public String findByUid(){
        //获得用户
        User existUser= (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        List<Order> oList= orderService.findByUid(existUser);

        //压栈olist
        ActionContext.getContext().getValueStack().set("oList",oList);

        return "findByUidSuccess";
    }

    /**
     * 根据订单id查询订单
     * @return
     */
    public String findByOid(){
        order=orderService.findByOid(oid);
        return "findByOidSuccess";
    }


    /**
     * 后台按状态查询订单
     * @return
     */
    public String adminFindByState(){
        PageBean<Order> pageBean=orderService.findByPage(state,page);

        //将pageBean的数据保存到页面,压栈
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);

        return "adminFindByStateSuccess";
    }

    /**
     * 后台查询所有订单
     * @return
     */
    public String adminFindAll(){
        PageBean<Order> pageBean=orderService.findByPage(page);
        //将pageBean的数据保存到页面,压栈
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);

        return "adminFindAllSuccess";
    }

    /**
     * 后台修改订单状态
     * @return
     */
    public String adminUpdateState(){
        //根据id查询订单
        order=orderService.findByOid(oid);
        order.setState(3);
        orderService.update(order);

        return "adminUpdateStateSuccess";
    }

    /**
     * 前台修改订单状态
     * @return
     */
    public String updateState(){
        //根据id查询订单
        order=orderService.findByOid(oid);
        order.setState(4);
        orderService.update(order);

        return "updateStateSuccess";
    }
}
