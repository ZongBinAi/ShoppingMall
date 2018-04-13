package order;

import cart.Cart;
import cart.CartItem;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import user.User;
import utils.PageBean;
import utils.PaymentUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
    private String r3_Amt;
    public void setR3_Amt(String r3_Amt) {
        this.r3_Amt = r3_Amt;
    }

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
    public String payOrder() throws IOException {
        //修改订单
        //查询这个id的订单
        Order currOrder=orderService.findByOid(oid);
        currOrder.setAddr(addr);
        currOrder.setName(name);
        currOrder.setPhone(phone);

        orderService.update(currOrder);

        //付款
        //定义付款参数
        String p0_Cmd = "Buy";
        String p1_MerId = "10001126856";
        String p2_Order = oid.toString();
        String p3_Amt = "0.01";
        String p4_Cur = "CNY";
        String p5_Pid = "";
        String p6_Pcat = "";
        String p7_Pdesc = "";
        String p8_Url = "http://localhost:8080/order_callBack.action";
        String p9_SAF = "";
        String pa_MP = "";
        String pr_NeedResponse = "1";
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,pd_FrpId , pr_NeedResponse, keyValue);

        StringBuffer sb = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
        sb.append("p0_Cmd=").append(p0_Cmd).append("&");
        sb.append("p1_MerId=").append(p1_MerId).append("&");
        sb.append("p2_Order=").append(p2_Order).append("&");
        sb.append("p3_Amt=").append(p3_Amt).append("&");
        sb.append("p4_Cur=").append(p4_Cur).append("&");
        sb.append("p5_Pid=").append(p5_Pid).append("&");
        sb.append("p6_Pcat=").append(p6_Pcat).append("&");
        sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
        sb.append("p8_Url=").append(p8_Url).append("&");
        sb.append("p9_SAF=").append(p9_SAF).append("&");
        sb.append("pa_MP=").append(pa_MP).append("&");
        sb.append("pd_FrpId=").append(pd_FrpId).append("&");
        sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
        sb.append("hmac=").append(hmac);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.sendRedirect(sb.toString());

        return NONE;
    }

    /**
     * 付款成功后方法
     * @return
     */
    public String callBack(){
        Order currOrder = orderService.findByOid(Integer.parseInt(r6_Order));
        currOrder.setState(2);// 修改订单状态.
        orderService.update(currOrder);

        this.addActionMessage("配置单款成功!订单号:"+r6_Order+" 付款金额:"+r3_Amt);
        return "msg";
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
