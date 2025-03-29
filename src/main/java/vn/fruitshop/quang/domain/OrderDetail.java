package vn.fruitshop.quang.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

// do 1 order có thể có nhiều product và 1 product có thể có trong nhiều order => many to many => cách đơn giản nhất tạo 1 bảng trung gian để có thể thêm các thuộc tính khác

@Entity
@Table(name = "order_detail")
public class OrderDetail {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  private long quantity;
  private double price;

  // Nhiều order detail trong một order -> many to one
  @ManyToOne
  @JoinColumn(name = "order_id")
  private Order order;

  // nhiều order detail là cùng về một product -> many to one
  @ManyToOne
  @JoinColumn(name = "product_id")
  private Product product;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public long getQuantity() {
    return quantity;
  }

  public void setQuantity(long quantity) {
    this.quantity = quantity;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public Order getOrder() {
    return order;
  }

  public void setOrder(Order order) {
    this.order = order;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }

  @Override
  public String toString() {
    return "OrderDetail [id=" + id + ", quantity=" + quantity + ", price=" + price + ", order=" + order + ", product="
        + product + "]";
  }

}
