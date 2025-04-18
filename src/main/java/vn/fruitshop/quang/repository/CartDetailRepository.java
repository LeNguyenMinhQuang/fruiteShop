package vn.fruitshop.quang.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import vn.fruitshop.quang.domain.Cart;
import vn.fruitshop.quang.domain.CartDetail;
import vn.fruitshop.quang.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail save(CartDetail cartDetail);

    CartDetail findByCartAndProduct(Cart cart, Product product);

    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findById(long id);

    void deleteById(long id);

}