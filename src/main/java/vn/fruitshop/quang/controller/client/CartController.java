package vn.fruitshop.quang.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.fruitshop.quang.domain.Cart;
import vn.fruitshop.quang.domain.CartDetail;
import vn.fruitshop.quang.domain.User;
import vn.fruitshop.quang.repository.ProductRepository;
import vn.fruitshop.quang.service.CartService;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {

    private final ProductRepository productRepository;
    private final CartService cartService;

    public CartController(CartService cartService, ProductRepository productRepository) {
        this.cartService = cartService;
        this.productRepository = productRepository;
    }

    @PostMapping("/addToCartFromHome/{id}")
    public String postAddToCartFromHome(@PathVariable("id") long id, HttpServletRequest request) {
        long productId = id;
        HttpSession session = request.getSession(false);
        String urlString = request.getHeader("Referer");

        String email = (String) session.getAttribute("email");

        this.cartService.handleAddProductToCartFromHome(email, productId, session);
        // if (urlString.contains("/shop")) {
        // return "redirect:/shop";
        // }
        return "redirect:" + urlString;
    }

    @PostMapping("/addToCartFromDetail/{id}")
    public String postAddToCartFromDetail(@PathVariable("id") long id, HttpServletRequest request,
            @RequestParam("quantity") int quantity) {

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");

        this.cartService.handleAddProductToCartFromDetail(email, id, session, quantity);

        return "redirect:/product/" + id;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");
        Cart cart = this.cartService.handleFindCartByUserId(userId);
        if (cart != null) {
            List<CartDetail> cds = cart.getCartDetails();
            double totalPrice = 0;
            for (CartDetail cd : cds) {
                totalPrice += (cd.getPrice() * cd.getQuantity());
            }
            model.addAttribute("list", cds);
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("cart", cart);
        } else {
            model.addAttribute("list", null);
        }

        return "client/cart/show";
    }

    @PostMapping("/removeFromCart/{id}")
    public String postRemoveFromCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        CartDetail cd = this.cartService.handleFinCartDetailById(id);
        Cart cart = cd.getCart();
        this.cartService.handleDeleteCartDetailById(id);
        int sum = cart.getSum();
        int newSum;
        if (sum <= 1) {
            newSum = 0;
        } else {
            newSum = sum - 1;
        }
        cart.setSum(newSum);
        this.cartService.handleSaveCart(cart);
        session.setAttribute("sumCart", newSum);

        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String postConfirmCheckout(Model model, @ModelAttribute("cart") Cart cart) {
        List<CartDetail> cds = cart == null ? new ArrayList<>() : cart.getCartDetails();
        this.cartService.handleUpdateCartBeforeCheckOut(cds);

        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");
        Cart cart = this.cartService.handleFindCartByUserId(userId);

        if (cart != null) {
            List<CartDetail> cds = cart.getCartDetails();
            double totalPrice = 0;
            for (CartDetail cd : cds) {
                totalPrice += (cd.getPrice() * cd.getQuantity());
            }

            model.addAttribute("list", cds);
            model.addAttribute("total", totalPrice);
            model.addAttribute("cart", cart);
        }

        return "client/cart/checkout";
    }

}
