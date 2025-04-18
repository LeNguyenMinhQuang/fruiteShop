package vn.fruitshop.quang.controller.client;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import vn.fruitshop.quang.domain.Product;
import vn.fruitshop.quang.domain.Product_;
import vn.fruitshop.quang.domain.dto.ProductCriteriaDTO;
import vn.fruitshop.quang.service.ProductService;

@Controller
public class HomePageController {

  private final ProductService productService;

  public HomePageController(ProductService productService) {
    this.productService = productService;
  }

  @GetMapping("/")
  public String getHomePage(Model model) {
    Pageable pageable = PageRequest.of(0, 3);
    Page<Product> prds = this.productService.handleGetProducts(pageable);
    List<Product> products = prds.getContent();

    model.addAttribute("products", products);
    return "client/homepage/show";
  }

  @GetMapping("/access-deny")
  public String getDeniedPage() {
    return "client/homepage/404";
  }

  @GetMapping("/product/{id}")
  public String getDetailPage(Model model, @PathVariable long id) {
    Product prd = this.productService.handleGetProductById(id);
    List<Product> prds = this.productService.handleGet3RandomProduct();
    model.addAttribute("product", prd);
    model.addAttribute("list", prds);
    return "client/homepage/detail";
  }

  @GetMapping("/shop")
  public String getShopPage(Model model, ProductCriteriaDTO productCriteriaDTO, HttpServletRequest request) {
    int page = Optional.ofNullable(productCriteriaDTO.getPage()).isPresent()
        ? Integer.parseInt(productCriteriaDTO.getPage().get())
        : 1;
    // int page = productCriteriaDTO.getPage() != null ?
    // Integer.parseInt(productCriteriaDTO.getPage().get()) : 1;
    PageRequest pageable = PageRequest.of(page - 1, 6);
    if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
      String sort = productCriteriaDTO.getSort().get();
      if (sort.equals("ASC")) {
        pageable = PageRequest.of(page - 1, 8, Sort.by(Product_.PRICE).ascending());
      } else if (sort.equals("DESC")) {
        pageable = PageRequest.of(page - 1, 8, Sort.by(Product_.PRICE).descending());
      } else {
        pageable = PageRequest.of(page - 1, 6);
      }
    }

    Page<Product> prds = this.productService.handleGetProductsWithSpec(pageable, productCriteriaDTO);
    long pages = prds.getTotalPages();

    List<Product> products = prds.getContent(); // convert từ Page sang List để view có thể forEach được

    // Lấy queryString
    String qs = request.getQueryString();
    if (qs != null && !qs.isBlank()) {
      qs = qs.replace("page=" + page, "");
    }

    model.addAttribute("products", products);
    model.addAttribute("currentPage", page);
    model.addAttribute("pages", pages);
    model.addAttribute("qs", qs);

    return "client/homepage/shop";
  }

}
