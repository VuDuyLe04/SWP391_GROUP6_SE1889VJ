package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.dto.request.ProductUpdateRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.ProductUpdateResponse;
import com.se1889_jv.swp391.swpstart.repository.ProductRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IProductService {
    public List<Product> getAllProducts();
    public List<String> getAllCategories();
    public List<Product> getAllProductsByStoreIdAndIsStorage(Long storeId);
    public Product getProductById(Long id);
    Product saveProduct(Product product);
    void deleteById(Long id);

    Page<Product> searchProductsByName(String name, Pageable pageable);
    Page<Product> getProductByStoreId(Long storeId, Pageable pageable);

    Page<Product> getAllProducts(Pageable pageable);
    void updateProduct(Product product);
    List<Product> getProductsByWarehouseId(Long warehouseId);

    ProductUpdateResponse updateProduct(ProductUpdateRequest request);

    Page<Product> getProductsByStoreIds(List<Long> storeIds, Pageable pageable);


}
