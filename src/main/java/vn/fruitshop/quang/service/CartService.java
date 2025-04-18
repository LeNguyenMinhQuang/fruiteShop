package vn.fruitshop.quang.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.fruitshop.quang.domain.Cart;
import vn.fruitshop.quang.domain.CartDetail;
import vn.fruitshop.quang.domain.User;
import vn.fruitshop.quang.domain.Product;
import vn.fruitshop.quang.repository.CartDetailRepository;
import vn.fruitshop.quang.repository.CartRepository;
import vn.fruitshop.quang.repository.ProductRepository;
import vn.fruitshop.quang.repository.UserRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public CartService(CartRepository cartRepository, CartDetailRepository cartDetailRepository,
            ProductRepository productRepository, UserRepository userRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }

    // Save
    public void handleSaveCart(Cart cart) {
        this.cartRepository.save(cart);
    }

    // Get

    public Cart handleFindCartByUserId(long id) {
        User temp = new User();
        temp.setId(id);
        return this.cartRepository.findByUser(temp);
    }

    public CartDetail handleFinCartDetailById(long id) {
        return this.cartDetailRepository.findById(id);
    }

    // Delete

    public void handleDeleteCartDetailById(long id) {
        this.cartDetailRepository.deleteById(id);
    }

    // Update before Checkout

    public void handleUpdateCartBeforeCheckOut(List<CartDetail> cds) {
        for (CartDetail cd : cds) {
            long cd_id = cd.getId();
            Optional<CartDetail> cdOptional = Optional.ofNullable(this.cartDetailRepository.findById(cd_id));
            if (cdOptional.isPresent()) {
                CartDetail updateCd = cdOptional.get();
                updateCd.setQuantity(cd.getQuantity());
                this.cartDetailRepository.save(updateCd);
            }
        }
    }

    // Add

    public void handleAddProductToCartFromHome(String email, long productId, HttpSession session) {
        User user = this.userRepository.findFirstByEmail(email);

        if (user != null) {
            // check user co cart khong, khong thi tao cart moi
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);

                cart = this.cartRepository.save(newCart);
            }

            // tao cartdetail
            Optional<Product> prdOptional = Optional.ofNullable(this.productRepository.findById(productId));
            if (prdOptional.isPresent()) {
                Product product = prdOptional.get();
                boolean isExistsProductInCart = this.cartDetailRepository.existsByCartAndProduct(cart, product);
                int quantity = 0;
                if (isExistsProductInCart) { // co roi thi tang 1
                    CartDetail cd = this.cartDetailRepository.findByCartAndProduct(cart, product);
                    quantity = (int) cd.getQuantity() + 1;
                    cd.setQuantity(quantity);
                    this.cartDetailRepository.save(cd);
                } else { // chua co thi tao moi
                    CartDetail cd = new CartDetail();
                    quantity = 1;
                    cd.setCart(cart);
                    cd.setProduct(product);
                    cd.setPrice(product.getPrice());
                    cd.setQuantity(quantity);

                    this.cartDetailRepository.save(cd);

                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sumCart", s);
                }
            }
        }

    }

    public void handleAddProductToCartFromDetail(String email, long productId, HttpSession session, int quantity) {
        User user = this.userRepository.findFirstByEmail(email);

        if (user != null) {
            // check user co cart khong, khong thi tao cart moi
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);

                cart = this.cartRepository.save(newCart);
            }

            // tao cartdetail
            Optional<Product> prdOptional = Optional.ofNullable(this.productRepository.findById(productId));
            if (prdOptional.isPresent()) {
                Product product = prdOptional.get();
                boolean isExistsProductInCart = this.cartDetailRepository.existsByCartAndProduct(cart, product);
                if (isExistsProductInCart) { // co roi thi tang quantity
                    CartDetail cd = this.cartDetailRepository.findByCartAndProduct(cart, product);
                    quantity = (int) cd.getQuantity() + quantity;
                    cd.setQuantity(quantity);
                    this.cartDetailRepository.save(cd);
                } else { // chua co thi tao moi
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(product);
                    cd.setPrice(product.getPrice());
                    cd.setQuantity(quantity);

                    this.cartDetailRepository.save(cd);

                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sumCart", s);
                }
            }
        }
    }
}
