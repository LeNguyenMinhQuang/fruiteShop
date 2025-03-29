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
  private String sold;
  private List<String> category;

  // 1 product có thể có trong nhiều order detail -> one to many

  @OneToMany(mappedBy = "product")
  private List<OrderDetail> orderDetails;

}
