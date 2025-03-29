package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.domain.dto.request.ProductCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.request.ProductUpdateRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.ProductUpdateResponse;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserStoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.WareHouseService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@Slf4j
public class
ProductController {
    private final ProductService productService;
    private final WareHouseService wareHouseService;
    private final UserStoreService userStoreService;
    @GetMapping("/product")
    public String getListProductPage(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "unitPrice") String sort,
            @RequestParam(defaultValue = "asc") String order,
            @RequestParam(defaultValue = "0") String store,
            @RequestParam(defaultValue = "0") String warehouseId,
            @RequestParam(name = "activeOnly", required = false) Boolean activeOnly,
            Model model,
            HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/access-deny";
        }
        Sort.Direction direction = order.equalsIgnoreCase("asc") ? Sort.Direction.ASC : Sort.Direction.DESC;
        Pageable pageable = PageRequest.of(page, 5, Sort.by(direction, sort));

        // Lấy danh sách cửa hàng mà user sở hữu
        List<Store> stores = Utility.getListStoreOfOwner(user);
        List<Long> storeIds = stores.stream().map(Store::getId).collect(Collectors.toList());

        Page<Product> productPage;
        if ("0".equals(store)) {
            // Lọc tất cả sản phẩm nhưng chỉ của các cửa hàng mà user sở hữu
            productPage = productService.getProductsByStoreIds(storeIds, pageable);
        } else {
            Long storeId = Long.parseLong(store);
            // Kiểm tra nếu storeId thuộc về user thì lấy sản phẩm, ngược lại trả về trang lỗi
            if (!storeIds.contains(storeId)) {
                return "redirect:/access-deny";
            }
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



    @GetMapping("/product/createProduct")
    public String getCreateProductPage(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");

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

//    @PostMapping("/product/create")
//    public String createProduct(
//            @Valid @ModelAttribute("product") Product product,
//            BindingResult result,
//            @RequestParam("image") MultipartFile image,
//            Model model,
//            HttpSession session
//    ) {
//        if (result.hasErrors()) {
//            log.info(String.valueOf(result.hasErrors()));
//            User user = (User) session.getAttribute("user");
//            List<Store> stores = Utility.getListStoreOfOwner(user);
//            List<WareHouse> wareHouses = wareHouseService.getAllWareHouseByListStore(stores);
//
//            model.addAttribute("listStore", stores);
//            model.addAttribute("wareHouses", wareHouses);
//            return "admin/product/create";
//        }
//        productService.saveProduct(product, image);
//        return "redirect:/product";
//    }

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
        User user = Utility.getUserInSession();
        Product product = productService.getProductById(id);
        List<Store> stores = userStoreService.getStoresForUser(user);

        List<WareHouse> wareHouses = wareHouseService.getAllWareHouseByListStore(stores);


        ProductUpdateRequest productDTO = new ProductUpdateRequest();
        productDTO.setId(product.getId());
        productDTO.setName(product.getName());
        productDTO.setImage(product.getImage());
        productDTO.setUnitPrice(product.getUnitPrice());
        productDTO.setStorage(product.isStorage());
        productDTO.setTotalQuantity(product.getTotalQuantity());
        productDTO.setCategory(product.getCategory());
        productDTO.setDescription(product.getDescription());
        productDTO.setStoreId(product.getStore() != null ? product.getStore().getId() : null);
        productDTO.setWarehouseId(product.getWarehouse() != null ? product.getWarehouse().getId() : null);
        model.addAttribute("wareHouses", wareHouses);
        model.addAttribute("product", productDTO);
        model.addAttribute("stores", stores);
        return "admin/product/update";
    }

    @PostMapping("/product/update")
    public String updateProduct(@ModelAttribute("product") @Valid Product product,
                                BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("product", product);
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

    @PostMapping("/update")
    public String updateProduct(@Valid @ModelAttribute("product")  ProductUpdateRequest request, BindingResult result, RedirectAttributes redirectAttributes) {
        try {
            if (result.hasErrors()) {
                StringBuilder errorMessage = new StringBuilder("Lỗi: ");
                result.getFieldErrors().forEach(error -> {
                    errorMessage.append(error.getField())
                            .append(" - ")
                            .append(error.getDefaultMessage())
                            .append("; ");
                });
                throw new RuntimeException(errorMessage.toString());
            }
            ProductUpdateResponse response = productService.updateProduct(request);
            redirectAttributes.addFlashAttribute("product", response);
            redirectAttributes.addFlashAttribute("message", "Cập nhật sản phẩm thành công!");
            return "redirect:/product/update/" + response.getId();
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage",   e.getMessage());

            return "redirect:/product/update/" + request.getId();
        }

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

    @PostMapping("/product/create")
    @ResponseBody
    public ResponseEntity<Map<String, String>> createProduct(
            @RequestPart("product") ProductCreationRequest request,
            @RequestPart("image") MultipartFile image) {
        Map<String, String> response = new HashMap<>();
        try {
            productService.createProduct(request, image);
            response.put("message", "Product created successfully.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("message", "Error creating product.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }

//    @PostMapping("/product/update")
//    @ResponseBody
//    public ResponseEntity<?> updateProduct(
//            @RequestPart("product") ProductUpdateRequest request,
//            @RequestPart(value = "image", required = false) MultipartFile image) {
//        try {
//            productService.updateProduct(request, image);
//            return ResponseEntity.ok().body("Product updated successfully.");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error updating product.");
//        }
//    }

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