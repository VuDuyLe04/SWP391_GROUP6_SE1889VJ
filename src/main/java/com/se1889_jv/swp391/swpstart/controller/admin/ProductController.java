package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.service.UploadImageService;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.service.implementservice.WareHouseService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private WareHouseService wareHouseService;
    @Autowired
    private UploadImageService uploadImageService;
    @Autowired
    private UserService userService;

    @GetMapping("/product")
    public String getListProductPage(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "unitPrice") String sort,
            @RequestParam(defaultValue = "asc") String order,
            @RequestParam(defaultValue = "0") String store,
            Model model,
            HttpSession session) {
        User user =(User) session.getAttribute("user");
        Sort.Direction direction = order.equalsIgnoreCase("asc") ? Sort.Direction.ASC : Sort.Direction.DESC;
        Pageable pageable = PageRequest.of(page, 5, Sort.by(direction, sort));
        if(user != null) {
            List<Store> stores = Utility.getListStoreOfOwner(user);
            Page<Product> productPage;
            if("0".equals(store)) {
                productPage = productService.getAllProducts(pageable);
            } else {
                Long storeId =  Long.parseLong(store);
                productPage = productService.getProductByStoreId(storeId, pageable);
            }
            model.addAttribute("listProduct", productPage.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", productPage.getTotalPages());
            model.addAttribute("sort", sort);
            model.addAttribute("order", order);
            model.addAttribute("productPage", productPage);
            model.addAttribute("stores", stores);
            model.addAttribute("store", store);
            return "admin/product/table";
        }
        return "redirect:/access-deny";

    }


    @GetMapping("/product/createProduct")
    public String getCreateProductPage(
            Model model, HttpSession session
    ) {
        User userSession = Utility.getUserInSession();
        User user = this.userService.findById(userSession.getId());

        if (user == null) {
            return "redirect:/login";
        }
        List<Store> stores = Utility.getListStoreOfOwner(user);
        List<WareHouse> wareHouses = wareHouseService.getAllWareHouseByListStore(stores);
        model.addAttribute("product", new Product());
        model.addAttribute("listStore", stores);
        model.addAttribute("wareHouses", wareHouses);
        return "admin/product/create";
    }

    @PostMapping("/product/create")
    public String createProduct(
            @Valid @ModelAttribute("product") Product product,
            BindingResult result,
            Model model,
            HttpSession session,
            @RequestParam("imageFile") MultipartFile file
    ) {
        if (result.hasErrors()) {

            User userSession = Utility.getUserInSession();
            User user = this.userService.findById(userSession.getId());
            List<Store> stores = Utility.getListStoreOfOwner(user);
            List<WareHouse> wareHouses = wareHouseService.getAllWareHouseByListStore(stores);
            model.addAttribute("store1", product.getStore());
            model.addAttribute("listStore", stores);
            model.addAttribute("wareHouses", wareHouses);
            return "admin/product/create";
        }
        String image = this.uploadImageService.handleSaveUploadFile(file, "images");
        product.setImage(image);
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
    public String updateProduct(@ModelAttribute("product") @Valid Product product,
                                BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("product", product); // Giữ ttin
            return "admin/product/update";
        }

        try {
            productService.updateProduct(product);
            model.addAttribute("successMessage", "Cập nhật sản phẩm thành công.");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Lỗi khi cập nhật sản phẩm: " + e.getMessage());
        }
        return "redirect:/product";
    }




    @GetMapping("/product/search")
    public String searchProduct(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "3") int size,
            @RequestParam(value = "sort", defaultValue = "name") String sort,
            @RequestParam(value = "direction", defaultValue = "ASC") String direction,
            Model model,
            RedirectAttributes redirectAttributes) {

        // Nếu name không có giá trị -> Redirect về trang /product
        if (name == null || name.trim().isEmpty()) {
            return "redirect:/product?page=" + page + "&size=" + size + "&sort=" + sort + "&direction=" + direction;
        }

        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.fromString(direction), sort));
        Page<Product> productPage = productService.searchProductsByName(name, pageable);

        model.addAttribute("listProduct", productPage.getContent());
        model.addAttribute("productPage", productPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sort", sort);
        model.addAttribute("direction", direction);
        model.addAttribute("name", name);

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