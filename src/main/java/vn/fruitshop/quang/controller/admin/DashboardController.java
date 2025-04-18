package vn.fruitshop.quang.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.fruitshop.quang.repository.OrderRepository;
import vn.fruitshop.quang.repository.ProductRepository;
import vn.fruitshop.quang.repository.UserRepository;

@Controller
public class DashboardController {
  private final UserRepository userRepository;
  private final ProductRepository productRepository;
  private final OrderRepository orderRepository;

  public DashboardController(UserRepository userRepository, ProductRepository productRepository,
      OrderRepository orderRepository) {
    this.userRepository = userRepository;
    this.productRepository = productRepository;
    this.orderRepository = orderRepository;
  }

  @GetMapping("/admin")
  public String getDashBoardPage(Model model) {
    long userCount = this.userRepository.count();
    long prodCount = this.productRepository.count();
    long ordCount = this.orderRepository.count();

    model.addAttribute("route", "dashboard/content.jsp");
    model.addAttribute("uCount", userCount);
    model.addAttribute("pCount", prodCount);
    model.addAttribute("oCount", ordCount);
    return "admin/show";
  }

}
