package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;

@Controller
public class
ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/product")
    public String getListProductPage(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "unitPrice") String sort,
            @RequestParam(defaultValue = "asc") String order,
            Model model) {
        Sort.Direction direction = order.equalsIgnoreCase("asc") ? Sort.Direction.ASC : Sort.Direction.DESC;
        Pageable pageable = PageRequest.of(page, 5, Sort.by(direction, sort));
        Page<Product> productPage = productService.getAllProducts(pageable);
        model.addAttribute("listProduct", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sort", sort);
        model.addAttribute("order", order);

        return "admin/product/table";
    }


    @GetMapping("/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/product/create")
    public String createProduct(Model model, @ModelAttribute("product") Product product) {
        productService.saveProduct(product);
        return "redirect:/product";
    }



    @PostMapping("/product/delete")
    public String deleteProduct(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        try {
            productService.deleteById(id);
            redirectAttributes.addFlashAttribute("successMessage", "Product deleted successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error deleting product: " + e.getMessage());
        }
        return "redirect:/product";
    }

    @GetMapping("/product/update/{id}")
    public String getUpdateProductPage(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/update";
    }

    @PostMapping("/product/update")
    public String updateProduct(@ModelAttribute("product") Product product, RedirectAttributes redirectAttributes) {
        try {
            productService.saveProduct(product);
            redirectAttributes.addFlashAttribute("successMessage", "Product updated successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating product: " + e.getMessage());
        }
        return "redirect:/product";
    }

    @GetMapping("/product/search")
    public String searchProduct(@RequestParam("name") String name, Model model) {
        List<Product> products;
        if (name != null && !name.isEmpty()) {
            products = productService.searchProductsByName(name);
        } else {
            products = productService.getAllProducts();
        }
        model.addAttribute("listProduct", products);
        return "admin/product/table";
    }

    @GetMapping("/product/view/{id}")
    public String viewProduct(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/view";
    }

//    @GetMapping("/product/sorted")
//    public String getSortedProductPage(
//            @RequestParam(defaultValue = "0") int page,
//            @RequestParam(defaultValue = "unitPrice") String sort,
//            @RequestParam(defaultValue = "asc") String order,
//            Model model) {
//
//        // Xác định hướng sắp xếp
//        Sort.Direction direction = order.equalsIgnoreCase("asc") ? Sort.Direction.ASC : Sort.Direction.DESC;
//
//        // Tạo Pageable với thông tin sắp xếp
//        Pageable pageable = PageRequest.of(page, 5, Sort.by(direction, sort));
//
//        // Gọi ProductService để lấy dữ liệu đã sắp xếp
//        Page<Product> productPage = productService.getAllProducts(pageable);
//
//        // Đưa dữ liệu vào Model
//        model.addAttribute("listProduct", productPage.getContent());
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", productPage.getTotalPages());
//        model.addAttribute("sort", sort);
//        model.addAttribute("order", order);
//
//        return "admin/product/table";
//    }





}