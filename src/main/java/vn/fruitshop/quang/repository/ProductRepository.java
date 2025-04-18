package vn.fruitshop.quang.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.fruitshop.quang.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    // định nghĩa các function để gọi bên service
    Product save(Product newProduct); // save có thể cả create và update

    // List<Product> findAll();

    Product findById(long id);

    void deleteById(long id);

    // Pagination and Sorting
    Page<Product> findAll(Pageable page);

    Page<Product> findAll(Specification spec, Pageable page);

    // Get 3 random
    @Query(value = "SELECT * FROM products ORDER BY RAND() LIMIT 3", nativeQuery = true)
    List<Product> findThreeRandomProducts();

}