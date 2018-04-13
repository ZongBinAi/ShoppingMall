package cart;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * 购物车对象
 */
public class Cart {
    //购物车存放多个购物项
    //map集合用商品id作为map的key，用购物项作为map的value;
    private Map<Integer,CartItem> map=new HashMap<Integer, CartItem>();

    //总计
    private Double total=0d;

    //提供三个动作：
    //将购物项添加到购物车
    public void addCart(CartItem cartItem){
        //获得购物项的标识id
        Integer pid=cartItem.getProduct().getPid();
        if (map.containsKey(pid)) {
            //说明购物车中有此购物项
            //购物车中已经用购物项信息
            CartItem _cartItem=map.get(pid);
            _cartItem.setCount(_cartItem.getCount()+cartItem.getCount());
        }else {
            //说明购物车中没有此购物项
            map.put(pid,cartItem);
        }

        //总计
        total+=cartItem.getSubtotal();
    }

    //将购物项从购物车中移除
    public void removeCart(Integer pid){
        //将购物项从map集合中移除
        CartItem cartItem=map.remove(pid);
        //设置总计的钱数
        total-=cartItem.getSubtotal();
    }

    //清空购物车
    public void clearCart(){
        //清空map
        map.clear();
        //总计设置为0；
        total=0d;
    }

    //提供一个获得map的value的集合
    //相当于有一个属性：cartItems
    public Collection<CartItem> getCartItems(){
        return map.values();
    }

    public Double getTotal() {
        return total;
    }
}
