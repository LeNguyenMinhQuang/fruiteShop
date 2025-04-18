package vn.fruitshop.quang.repository;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import vn.fruitshop.quang.domain.Order;
import vn.fruitshop.quang.domain.Product;
import vn.fruitshop.quang.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>, JpaSpecificationExecutor<Order> {

    Order save(Order order);

    Page<Order> findAll(Pageable pageable);

    Order findById(long id);

    List<Order> findByUser(User user);

}
