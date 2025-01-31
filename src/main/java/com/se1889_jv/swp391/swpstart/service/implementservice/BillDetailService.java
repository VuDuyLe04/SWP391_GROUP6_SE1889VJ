package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.repository.BillDetailRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IBillDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BillDetailService implements IBillDetailService {
    @Autowired
    private ProductService productService;
    @Autowired
    private PackagingService packagingService;
    @Autowired
    private BillDetailRepository billDetailRepository;
    @Override
    public BillDetail createBillDetail(BillDetail bd, Bill bill, Long productId) {

        Product p = productService.getProductById(productId);
        if (p == null) {
            throw new RuntimeException("Product not found with ID: " + productId);
        }
        BillDetail billDetail = new BillDetail();
        billDetail.setQuantity(bd.getQuantity());
        billDetail.setListedPrice(bd.getListedPrice());
        billDetail.setActualSellPrice(bd.getActualSellPrice());
        billDetail.setLiftPrice(bd.getLiftPrice());
        billDetail.setLift(bd.getLiftPrice() > 0);
        billDetail.setTotalLiftProductPrice(bd.getQuantity() * bd.getLiftPrice());
        billDetail.setPackaging(packagingService.getPackagingByPackingType(bd.getPackaging().getPackageType()));
        billDetail.setBill(bill);
        billDetail.setProduct(p);
       return billDetailRepository.save(billDetail);
    }
}
