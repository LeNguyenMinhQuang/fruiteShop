package vn.fruitshop.quang.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import vn.fruitshop.quang.domain.Product;
import vn.fruitshop.quang.domain.dto.ProductCriteriaDTO;
import vn.fruitshop.quang.repository.ProductRepository;
import vn.fruitshop.quang.service.specification.ProductSpec;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    // GET
    public Page<Product> handleGetProducts(Pageable pageable) {
        Page<Product> products = this.productRepository.findAll(pageable);
        return products;
    }

    public Page<Product> handleGetProducts(Pageable pageable, String name) {
        Page<Product> products = this.productRepository.findAll(ProductSpec.nameLike(name), pageable);
        return products;
    }

    public Specification<Product> buildPriceSpecification(
            List<String> price) {
        Specification<Product> combinedSpec = (root, query, criteriaBuilder) -> criteriaBuilder.disjunction();

        for (String p : price) {
            double min = 0;
            double max = 0;

            switch (p) {
                case "10-":
                    min = 1;
                    max = 9;

                    break;
                case "10-50":
                    min = 10;
                    max = 50;

                    break;
                case "50+":
                    min = 51;
                    max = 100000;

                    break;
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpec.priceRangeList(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }
        return combinedSpec;
    }

    public Page<Product> handleGetProductsWithSpec(Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {
        Specification<Product> combinedSpec = Specification.where(null);

        if (productCriteriaDTO.getName() != null) {
            if (productCriteriaDTO.getName().isPresent()) {
                Specification<Product> currentSpecs = ProductSpec.nameLike(productCriteriaDTO.getName().get());
                combinedSpec = combinedSpec.and(currentSpecs);
            }
        }

        if (productCriteriaDTO.getCategory() != null) {
            if (productCriteriaDTO.getCategory().isPresent()) {
                Specification<Product> currentSpecs = ProductSpec
                        .matchCategoryList(productCriteriaDTO.getCategory().get());
                combinedSpec = combinedSpec.and(currentSpecs);
            }
        }

        if (productCriteriaDTO.getPrice() != null) {
            if (productCriteriaDTO.getPrice().isPresent()) {
                Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
                combinedSpec = combinedSpec.and(currentSpecs);
            }
        }

        return this.productRepository.findAll(combinedSpec, pageable);
    }

    // Save
    public void handleSaveProduct(Product product) {
        this.productRepository.save(product);
    }

    // Get by id
    public Product handleGetProductById(long id) {
        return this.productRepository.findById(id);
    }

    // Delete
    public void handleDeleteProduct(Product product) {
        this.productRepository.delete(product);
    }

    // Get 3 random
    public List<Product> handleGet3RandomProduct() {
        return this.productRepository.findThreeRandomProducts();
    }

}
