package cart;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import product.Product;
import product.ProductService;

import javax.servlet.http.HttpServletRequest;


/**
 * 购物模块Action
 */
public class CartAction extends ActionSupport{
    //接收pid
    private Integer pid;
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    //接收count
    private Integer count;
    public void setCount(Integer count) {
        this.count = count;
    }

    //注入productService
    private ProductService productService;
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }


    /**
     * 从session范围获得购物车
     * @param request
     * @return
     */
    public Cart getCart(HttpServletRequest request){
        //从session范围获得Cart对象
        Cart cart= (Cart) request.getSession().getAttribute("cart");
        //判断
        if (cart == null) {
            //创建购物车
            cart=new Cart();
            //将购物车对象放到session范围：
            request.getSession().setAttribute("cart",cart);
        }
        return cart;
    }

    /**
     * 添加到购物车方法
     * @return
     */
    public String addCart(){
        //查询商品信息：
        Product product=productService.findByPid(pid);

        //创建一个购物项：
        CartItem cartItem=new CartItem();
        cartItem.setCount(count);
        cartItem.setProduct(product);

        //获取购物车需要依赖request对象
        HttpServletRequest request= ServletActionContext.getRequest();
        Cart cart=getCart(request);
        cart.addCart(cartItem);

        return "addCartSuccess";
    }

    /**
     * 清空购物车
     * @return
     */
    public String clearCart(){
        //获得cart
        HttpServletRequest request=ServletActionContext.getRequest();
        Cart cart=getCart(request);

        cart.clearCart();

        return "clearCartSuccess";
    }

    /**
     * 清空购物项
     * @return
     */
    public String removeCart(){
        //获得cart
        HttpServletRequest request=ServletActionContext.getRequest();
        Cart cart=getCart(request);

        cart.removeCart(pid);

        return "removeCartSuccess";
    }

    /**
     * 我的购物车（从header里面跳转）
     * @return
     */
    public String myCart(){
        return "myCartSuccess";
    }
}
