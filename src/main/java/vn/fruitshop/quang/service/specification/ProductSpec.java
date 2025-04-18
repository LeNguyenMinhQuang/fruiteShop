package vn.fruitshop.quang.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.fruitshop.quang.domain.Product;
import vn.fruitshop.quang.domain.Product_;

public class ProductSpec {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> matchCategory(String factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.CATEGORY), factory);
    }

    public static Specification<Product> minPrice(double minPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE), minPrice);
    }

    public static Specification<Product> maxPrice(double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), maxPrice);
    }

    public static Specification<Product> matchCategoryList(List<String> factoryList) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.CATEGORY)).value(factoryList);
    }

    public static Specification<Product> priceRange(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(criteriaBuilder.ge(root.get(Product_.PRICE), min),
                criteriaBuilder.le(root.get(Product_.PRICE), max));
    }

    public static Specification<Product> priceRangeList(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), min, max);
    }

}
