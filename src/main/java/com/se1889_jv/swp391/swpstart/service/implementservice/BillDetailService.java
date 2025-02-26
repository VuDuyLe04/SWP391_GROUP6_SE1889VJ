package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Packaging;
import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailResponse;
import com.se1889_jv.swp391.swpstart.repository.BillDetailRepository;
import com.se1889_jv.swp391.swpstart.repository.BillRepository;
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
    @Autowired
    private BillRepository billRepository;
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

    @Override
    public BillDetail createBillDetail1(BillDetailRequest request) {

        Product p = productService.getProductById(request.getProductId());
        Packaging packaging = packagingService.getPackagingById(request.getPackagingId());
        if (p == null) {
            throw new RuntimeException("Product not found with ID: " + request.getProductId());
        } else {
            if (!p.isStorage()){
                throw new RuntimeException("Product is storage");
            }
        }
        BillDetail billDetail = new BillDetail();
        billDetail.setQuantity(request.getQuantity());
        billDetail.setListedPrice(request.getListedPrice());
        billDetail.setActualSellPrice(request.getActualSellPrice());
        billDetail.setLiftPrice(packaging.getLiftCost());
        billDetail.setLift(packaging.getLiftCost() > 0);
        billDetail.setPackaging(packagingService.getPackagingById(request.getPackagingId()));
        billDetail.setProduct(p);
        billDetail.setNameProduct(p.getName());
        billDetail.setTotalLiftProductPrice(request.getQuantity() * packaging.getLiftCost());
        billDetail.setTotalProductPrice(request.getActualSellPrice() * request.getQuantity() - request.getDiscount()*request.getQuantity());
        billDetail.setBill(billRepository.findById(request.getBillId()).get());

        BillDetail result = billDetailRepository.save(billDetail);
        try{
            System.out.println(new ObjectMapper().writeValueAsString(result));
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        // Log dữ liệu JSON
        return result;
    }
    @Override
    public BillDetailResponse createBillDetail2(BillDetailRequest request) {
        Product p = productService.getProductById(request.getProductId());
        Packaging packaging = packagingService.getPackagingById(request.getPackagingId());

        if (p == null) {
            throw new RuntimeException("Product not found with ID: " + request.getProductId());
        }
        if (!p.isStorage()) {
            throw new RuntimeException("Product is storage");
        }

        BillDetail billDetail = new BillDetail();
        billDetail.setQuantity(request.getQuantity());
        billDetail.setListedPrice(request.getListedPrice());
        billDetail.setActualSellPrice(request.getActualSellPrice());
        billDetail.setLiftPrice(packaging.getLiftCost());
        billDetail.setLift(packaging.getLiftCost() > 0);
        billDetail.setPackaging(packaging);
        billDetail.setProduct(p);
        billDetail.setNameProduct(p.getName());
        billDetail.setTotalLiftProductPrice(request.getQuantity() * packaging.getLiftCost());
        billDetail.setTotalProductPrice(
                request.getActualSellPrice() * request.getQuantity() - request.getDiscount() * request.getQuantity()
        );
        billDetail.setBill(billRepository.findById(request.getBillId()).orElseThrow(
                () -> new RuntimeException("Bill not found with ID: " + request.getBillId())
        ));

        BillDetail savedBillDetail = billDetailRepository.save(billDetail);

        // Chuyển đổi từ BillDetail sang BillDetailResponse
        BillDetailResponse response = new BillDetailResponse(savedBillDetail);

        // Log JSON (bỏ `createdAt`)
        try {
            System.out.println(new ObjectMapper().writeValueAsString(response));
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        return response;
    }

}
