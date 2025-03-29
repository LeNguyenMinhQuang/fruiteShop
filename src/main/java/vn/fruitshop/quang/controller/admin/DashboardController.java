package vn.fruitshop.quang.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

  @GetMapping("/admin")
  public String getDashBoardPage(Model model) {
    model.addAttribute("route", "dashboard/content.jsp");
    return "admin/show";
  }

}
