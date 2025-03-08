package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.domain.dto.ProductResponse;
import com.se1889_jv.swp391.swpstart.repository.ProductRepository;
import com.se1889_jv.swp391.swpstart.repository.WareHouseRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IProductService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Service
public class ProductService implements IProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    PackagingService packagingService;
    @Autowired
    private WareHouseRepository wareHouseRepository;
    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }


    @Override
    public Product saveProduct(Product product) {
        product.setStorage(true);
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
    public List<Product> getAllProductsByStoreIdAndIsStorage(Long storeId, Pageable pageable) {
        return productRepository.findAllByStoreIdAndStorageIsTrue(storeId, pageable).getContent();
    }

    public List<ProductResponse> getAllProductForSale(Long storeId, Pageable pageable) {
        Page<Product> products = productRepository.findAllByStoreIdAndStorageIsTrue(storeId, pageable);
        List<Product> products1 = products.getContent();
        return products1.stream()
                .map(product -> convertToProductResponse(product, storeId))
                .collect(Collectors.toList());
    }
    private ProductResponse convertToProductResponse(Product product, Long storeId) {
        ProductResponse productResponse = modelMapper.map(product, ProductResponse.class);
        productResponse.setWarehouseName(product.getWarehouse().getName());
        productResponse.setPackagings(packagingService.getAllPackagingForQuantityProduct(product.getTotalQuantity(), storeId));
        return productResponse;
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

    @Override
    public void updateProduct(Product product) {
        Optional<Product> productOptional = productRepository.findById(product.getId());
        if (productOptional.isPresent()) {
            productOptional.get().setName(product.getName());
            productOptional.get().setDescription(product.getDescription());
            productOptional.get().setStorage(product.isStorage());
            productOptional.get().setCategory(product.getCategory());
            productOptional.get().setTotalQuantity(product.getTotalQuantity());
            productOptional.get().setImage(product.getImage());
            productOptional.get().setUnitPrice(product.getUnitPrice());
            productRepository.save(productOptional.get());
        }
    }

    @Override
    public List<ProductResponse> getProductBySearchKeyword(String keyword, Pageable pageable, Long storeId) {
        Page<Product> products = productRepository.findAllByStoreIdAndNameContainingIgnoreCase(storeId,keyword, pageable);
        List<Product> products1 = products.getContent();
        return products1.stream()
                .map(product -> convertToProductResponse(product, storeId))
                .collect(Collectors.toList());
    }

}
