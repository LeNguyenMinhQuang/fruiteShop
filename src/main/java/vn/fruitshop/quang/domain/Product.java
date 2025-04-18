package vn.fruitshop.quang.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.persistence.OneToMany;

// annotation để biến model thành table(entity, model) trong database
@Entity
@Table(name = "products") // đặt tên khác cho table trong database
public class Product {

  // buộc phải có để khai báo id
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY) // tự sinh id (Auto, Table, Sequence, indentity)
  private long id;

  @NotEmpty(message = "Name is not empty")
  private String name;

  @Min(value = 0, message = "Price must be greater than 0")
  private double price;

  private String image;

  @Column(columnDefinition = "MEDIUMTEXT")
  private String description;
  private String quantity;
  private String sold = "0";
  private String category;

  // 1 product có thể có trong nhiều order detail -> one to many

  @OneToMany(mappedBy = "product")
  private List<OrderDetail> orderDetails;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getQuantity() {
    return quantity;
  }

  public void setQuantity(String quantity) {
    this.quantity = quantity;
  }

  public String getSold() {
    return sold;
  }

  public void setSold(String sold) {
    this.sold = sold;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public List<OrderDetail> getOrderDetails() {
    return orderDetails;
  }

  public void setOrderDetails(List<OrderDetail> orderDetails) {
    this.orderDetails = orderDetails;
  }

}
