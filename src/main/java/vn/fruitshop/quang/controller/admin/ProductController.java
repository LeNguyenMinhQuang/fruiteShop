package vn.fruitshop.quang.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.fruitshop.quang.domain.Product;
import vn.fruitshop.quang.service.ProductService;
import vn.fruitshop.quang.service.UploadService;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;

    }

    @GetMapping("/admin/product")
    public String getProductsPage(Model model, @RequestParam("page") Optional<String> pageOptional) {

        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        // tính số trang
        // long totalPrd = this.productService.handleCountAllProducts();
        // long pages = totalPrd / 5;

        PageRequest pageable = PageRequest.of(page - 1, 5);
        Page<Product> prds = this.productService.handleGetProducts(pageable);
        long pages = prds.getTotalPages();

        List<Product> products = prds.getContent(); // convert từ Page sang List để view có thể forEach được
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("pages", pages);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProductPage(Model model, @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult productResult,
            @RequestParam("imagePrd") MultipartFile file) {

        // validate
        List<FieldError> errors = productResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        if (productResult.hasErrors()) {
            return "admin/product/create";
        }

        // image
        String image = this.uploadService.handleSaveUploadFile(file, "products");
        newProduct.setImage(image);

        // save
        this.productService.handleSaveProduct(newProduct);
        // redirect: chuyển hướng đến link khác
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String GetDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.handleGetProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.handleGetProductById(id);
        model.addAttribute("deleteProduct", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postMethodName(Model model, @ModelAttribute("deleteProduct") Product deleteProduct) {
        this.productService.handleDeleteProduct(deleteProduct);
        return "redirect:/admin/product";
    }

}
