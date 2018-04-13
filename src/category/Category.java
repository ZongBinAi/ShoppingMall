package category;

import categorysecond.CategorySecond;

import java.util.HashSet;
import java.util.Set;

/**
 * 一级分类的实体类
 */
public class Category {
    private Integer cid;
    private String cname;
    //二级分类的集合
    private Set<CategorySecond> categorySeconds=new HashSet<CategorySecond>();

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Set<CategorySecond> getCategorySeconds() {
        return categorySeconds;
    }

    public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
        this.categorySeconds = categorySeconds;
    }
}
