package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Product;

import java.util.List;

public interface IProductService {
    public List<Product> getAllProducts();
    public List<String> getAllCategories();

}
