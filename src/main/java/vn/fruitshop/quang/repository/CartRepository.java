package vn.fruitshop.quang.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import vn.fruitshop.quang.domain.Cart;
import vn.fruitshop.quang.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);

    Cart save(Cart cart);

}