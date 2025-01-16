package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.repository.ProductRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService implements IProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    @Override
    public List<String> getAllCategories() {
        return productRepository.findDistinctCategories();
    }

    @Override
    public List<Product> getAllProductsIsStorage() {
        return productRepository.findProductByStorageIsTrue();
    }
}
