package vn.fruitshop.quang.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.fruitshop.quang.domain.Cart;
import vn.fruitshop.quang.domain.CartDetail;
import vn.fruitshop.quang.domain.Order;
import vn.fruitshop.quang.domain.OrderDetail;
import vn.fruitshop.quang.domain.User;
import vn.fruitshop.quang.repository.CartDetailRepository;
import vn.fruitshop.quang.repository.CartRepository;
import vn.fruitshop.quang.repository.OrderDetailRepository;
import vn.fruitshop.quang.repository.OrderRepository;
import vn.fruitshop.quang.repository.ProductRepository;
import vn.fruitshop.quang.repository.UserRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository,
            ProductRepository productRepository, UserRepository userRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    public void handlePlaceOrder(long userId, HttpSession session, String name, String phone, String address) {
        // create order
        Order order = new Order();
        User user = this.userRepository.findById(userId);
        order.setUser(user);
        order.setReceiverName(name);
        order.setReceiverPhone(phone);
        order.setReceiverAddress(address);
        order.setStatus("Pending");

        // create order detail
        Cart cart = this.cartRepository.findByUser(user);
        double total = 0;

        if (cart != null) {
            List<CartDetail> cds = cart.getCartDetails();

            for (CartDetail cd : cds) {
                total += (cd.getPrice() * cd.getQuantity());
            }

            order.setTotalPrice(total);
            order = this.orderRepository.save(order);

            if (cds != null) {
                for (CartDetail cd : cds) {
                    OrderDetail od = new OrderDetail();
                    od.setPrice(cd.getPrice());
                    od.setQuantity(cd.getQuantity());
                    od.setOrder(order);
                    od.setProduct(cd.getProduct());
                    this.orderDetailRepository.save(od);
                }
            }

            // delete cart and detail cart

            for (CartDetail cd : cds) {
                this.cartDetailRepository.deleteById(cd.getId());
            }

            cart.setSum(0);
            cart.getCartDetails().clear();
            this.cartRepository.save(cart);

            // update session

            session.setAttribute("sumCart", 0);
        }

    }

    public Page<Order> handleGetAllOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Order handleGetOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void handleDeleteOrder(Order order) {
        Order ord = this.handleGetOrderById(order.getId());
        List<OrderDetail> list = ord.getOrderDetails();
        if (list != null) {
            for (OrderDetail od : list) {
                this.orderDetailRepository.delete(od);
            }
        }
        this.orderRepository.delete(ord);
    }

    public void handleSaveOrder(Order order) {
        this.orderRepository.save(order);
    }

    public List<Order> handleGetOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }
}
