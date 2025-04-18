package vn.fruitshop.quang.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.fruitshop.quang.domain.Order;
import vn.fruitshop.quang.domain.OrderDetail;
import vn.fruitshop.quang.domain.User;
import vn.fruitshop.quang.service.OrderService;

@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping("/placeOrder")
    public String postPlaceOrder(HttpServletRequest request, @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("receiverAddress") String receiverAddress) {

        HttpSession session = request.getSession(false);
        Long userId = (Long) session.getAttribute("id");

        this.orderService.handlePlaceOrder(userId, session, receiverName, receiverPhone, receiverAddress);

        return "redirect:/";
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = pageOptional.isPresent() ? Integer.parseInt(pageOptional.get()) : 1;

        Pageable pageable = PageRequest.of(page - 1, 5);

        Page<Order> order_ = this.orderService.handleGetAllOrders(pageable);
        long pages = order_.getTotalPages();

        List<Order> orders = order_.getContent();

        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("pages", pages);

        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailsPage(Model model, @PathVariable("id") long id) {
        Order order = this.orderService.handleGetOrderById(id);
        List<OrderDetail> ords = order.getOrderDetails();
        model.addAttribute("order", order);
        model.addAttribute("list", ords);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getOrderDeletePage(Model model, @PathVariable("id") long id) {
        Order order = this.orderService.handleGetOrderById(id);
        model.addAttribute("deleteOrder", order);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(Model model, @ModelAttribute("deleteOrder") Order order) {
        this.orderService.handleDeleteOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getOrderUpdatePage(Model model, @PathVariable("id") long id) {
        Order order = this.orderService.handleGetOrderById(id);
        model.addAttribute("updateOrder", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String postUpdateOrder(Model model, @ModelAttribute("updateOrder") Order order_) {
        Order order = this.orderService.handleGetOrderById(order_.getId());
        order.setStatus(order_.getStatus());
        this.orderService.handleSaveOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/history")
    public String getHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = new User();
        user.setId((long) session.getAttribute("id"));
        List<Order> orders = this.orderService.handleGetOrderByUser(user);
        model.addAttribute("list", orders);
        return "client/cart/history";
    }

    @GetMapping("/history/{id}")
    public String getHistoryDetailPage(Model model, HttpServletRequest request, @PathVariable("id") long id) {
        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");
        Order order = this.orderService.handleGetOrderById(id);
        if (order == null) {
            return "client/homepage/404";
        }
        if (userId == order.getUser().getId()) {
            model.addAttribute("order", order);
            model.addAttribute("list", order.getOrderDetails());
            return "client/cart/historyDetail";
        } else {
            return "client/homepage/404";
        }

    }

}
