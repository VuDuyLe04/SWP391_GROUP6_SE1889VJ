package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.domain.dto.request.ProductCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.request.ProductUpdateRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.ProductUpdateResponse;
import com.se1889_jv.swp391.swpstart.repository.ProductRepository;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.repository.WareHouseRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IProductService;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService implements IProductService {

    private final ProductRepository productRepository;
    private final StoreRepository storeRepository;
    private final WareHouseRepository wareHouseRepository;
    private final CloudinaryService cloudinaryService;

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product saveProduct(Product product, MultipartFile image) {
        if (image != null && !image.isEmpty()) {
            String imageUrl = cloudinaryService.uploadImage(image);
            product.setImage(imageUrl);
        }
        return productRepository.save(product);
    }

    public Product findById(Long id) {
        return productRepository.findById(id).orElse(null);  // Tìm sản phẩm theo id
    }


    public void deleteById(Long id) {
        productRepository.deleteById(id);
    }

    @Override
    public Page<Product> searchProductsByName(String name, Pageable pageable) {
        return productRepository.findAllByNameContainingIgnoreCase(name, pageable);
    }


    @Override
    public List<String> getAllCategories() {
        return productRepository.findDistinctCategories();
    }

    @Override
    public List<Product> getAllProductsByStoreIdAndIsStorage(Long storeId) {
        return productRepository.findAllByStoreIdAndStorageIsTrue(storeId);
    }

    @Override
    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }



    @Override
    public Page<Product> getProductByStoreId(Long storeId, Pageable pageable) {
        return productRepository.findAllByStoreId(storeId, pageable);
    }

    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

//    @Override
//    public void updateProduct(Product product) {
//        Optional<Product> productOptional = productRepository.findById(product.getId());
//        if (productOptional.isPresent()) {
//            productOptional.get().setName(product.getName());
//            productOptional.get().setDescription(product.getDescription());
//            productOptional.get().setStorage(product.isStorage());
//            productOptional.get().setCategory(product.getCategory());
//            productOptional.get().setTotalQuantity(product.getTotalQuantity());
//            productOptional.get().setImage(product.getImage());
//            productOptional.get().setUnitPrice(product.getUnitPrice());
//            productRepository.save(productOptional.get());
//        }
//    }

    @Override
    public List<Product> getProductsByWarehouseId(Long warehouseId) {
        return productRepository.findAllByWarehouseId(warehouseId);
    }

    @Override
    public ProductUpdateResponse updateProduct(ProductUpdateRequest request) {
    System.out.println(request.toString());
        Product product = productRepository.findById(request.getId())
                .orElseThrow(() -> new RuntimeException("Product not found"));

        if(request.getName() != null && !request.getName().isEmpty()) {
            product.setName(request.getName());
        }
        if(request.getDescription() != null) {
            product.setDescription(request.getDescription());
        }
        if(request.getCategory() != null) {
            product.setCategory(request.getCategory());
        }
        if(request.getStorage()) {
            product.setStorage(true);
        }
        if(!request.getStorage()) {
            product.setStorage(false);
        }
        if(request.getUnitPrice() != null){
            product.setUnitPrice(request.getUnitPrice());
        }
        if(request.getStoreId() != null) {
            Store store = storeRepository.findById(request.getStoreId())
                    .orElseThrow(() -> new RuntimeException("Store not found"));
            product.setStore(store);

        }

        if(request.getWarehouseId() != null) {
            WareHouse warehouse = wareHouseRepository.findById(request.getWarehouseId())
                    .orElseThrow(() -> new RuntimeException("Warehouse not found"));
            product.setWarehouse(warehouse);
        }

        productRepository.save(product);

        return ProductUpdateResponse.builder()
                .id(product.getId())
                .name(product.getName())
                .image(null)
                .description(product.getDescription())
                .category(product.getCategory())
                .unitPrice(product.getUnitPrice())
                .storeId(product.getStore().getId())
                .warehouseId(product.getWarehouse().getId())
                .storage(product.isStorage())
                .build();
    }

    //lay ra san pham cua chu cua hang
    @Override
    public Page<Product> getProductsByStoreIds(List<Long> storeIds, Pageable pageable) {
        return productRepository.findByStoreIdIn(storeIds, pageable);
    }

    @Transactional
    @Override
    public void createProduct(@Valid ProductCreationRequest request, MultipartFile image) {
        Store store = storeRepository.findById(request.getStoreId())
                .orElseThrow(() -> new RuntimeException("Store not found"));

        WareHouse wareHouse = wareHouseRepository.findById(request.getWareHouseId())
                .orElseThrow(() -> new RuntimeException("Warehouse not found"));

        String imageUrl = cloudinaryService.uploadImage(image);

        Product product = Product.builder()
                .name(request.getName())
                .category(request.getCategory())
                .description(request.getDescription())
                .unitPrice(request.getUnitPrice())
                .storage(request.isStorage())
                .totalQuantity(request.getTotalQuantity())
                .image(imageUrl)
                .createdAt(Instant.now())
                .store(store)
                .warehouse(wareHouse)
                .build();

        productRepository.save(product);
        log.info("Product created");

    }

//    @Override
//    public void updateProduct(@Valid ProductUpdateRequest request, MultipartFile image) {
//        Product product = productRepository.findById(request.getId())
//                .orElseThrow(() -> new RuntimeException("Product not found"));
//        if(image != null) {
//            String imageUrl = cloudinaryService.uploadImage(image);
//            product.setImage(imageUrl);
//        }
//        if (request.getName() != null) {
//            product.setName(request.getName());
//        }
//        if (request.getUnitPrice() != null) {
//            product.setUnitPrice(request.getUnitPrice());
//        }
//        if (request.getCategory() != null) {
//            product.setCategory(request.getCategory());
//        }
//        if (request.getStorage() != null) {
//            product.setStorage(request.getStorage());
//        }
//        if (request.getTotalQuantity() != null) {
//            product.setTotalQuantity(request.getTotalQuantity());
//        }
//        if (request.getDescription() != null) {
//            product.setDescription(request.getDescription());
//        }
//
//        if(request.getStoreId() != null && product.getStore().getId() != request.getStoreId()) {
//            Store store = storeRepository.findById(request.getStoreId())
//                    .orElseThrow(() -> new RuntimeException("Store not found"));
//            product.setStore(store);
//        }
//
//        if(request.getWarehouseId() != null && product.getWarehouse().getId() != request.getWarehouseId()) {
//            WareHouse wareHouse = wareHouseRepository.findById(request.getWarehouseId())
//                    .orElseThrow(() -> new RuntimeException("Warehouse not found"));
//            product.setWarehouse(wareHouse);
//        }
//        productRepository.save(product);
//        log.info("Product updated");
//    }



}
