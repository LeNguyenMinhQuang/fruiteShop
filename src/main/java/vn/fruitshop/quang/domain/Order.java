package vn.fruitshop.quang.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

// annotation để biến model thành table(entity, model) trong database
@Entity
@Table(name = "orders") // phải đặt tên vì ko thể tạo bảng order do trùng với phương thức orderBy của
                        // sql
public class Order {

  // buộc phải có để khai báo id
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY) // tự sinh id (Auto, Table, Sequence, indentity)
  private long id;

  private double totalPrice;

  // user id, nhiều order thuộc về 1 user
  @ManyToOne
  @JoinColumn(name = "user_id")
  private User user;

  // 1 detail chỉ thuộc về 1 order, nhg 1 order có thể có nhiều detail -> one to
  // many

  @OneToMany(mappedBy = "order")
  private List<OrderDetail> orderDetails;

  // thong tin ng nhan
  private String receiverName;
  private String receiverPhone;
  private String receiverAddress;
  private String status;

  public Order() {
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public double getTotalPrice() {
    return totalPrice;
  }

  public void setTotalPrice(double totalPrice) {
    this.totalPrice = totalPrice;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public List<OrderDetail> getOrderDetails() {
    return orderDetails;
  }

  public void setOrderDetails(List<OrderDetail> orderDetails) {
    this.orderDetails = orderDetails;
  }

  public String getReceiverName() {
    return receiverName;
  }

  public void setReceiverName(String receiverName) {
    this.receiverName = receiverName;
  }

  public String getReceiverPhone() {
    return receiverPhone;
  }

  public void setReceiverPhone(String receiverPhone) {
    this.receiverPhone = receiverPhone;
  }

  public String getReceiverAddress() {
    return receiverAddress;
  }

  public void setReceiverAddress(String receiverAddress) {
    this.receiverAddress = receiverAddress;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  @Override
  public String toString() {
    return "Order [id=" + id + ", totalPrice=" + totalPrice + "]";
  }

}
