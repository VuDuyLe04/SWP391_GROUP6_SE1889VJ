package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Packaging;
import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailImportRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailResponse;
import com.se1889_jv.swp391.swpstart.exception.AppException;
import com.se1889_jv.swp391.swpstart.exception.ErrorException;
import com.se1889_jv.swp391.swpstart.mapper.ModalMapperConfig;
import com.se1889_jv.swp391.swpstart.repository.BillDetailRepository;
import com.se1889_jv.swp391.swpstart.repository.BillRepository;
import com.se1889_jv.swp391.swpstart.repository.ProductRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IBillDetailService;
import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
public class BillDetailService implements IBillDetailService {
    @Autowired
    private ProductService productService;
    @Autowired
    private PackagingService packagingService;
    @Autowired
    private BillDetailRepository billDetailRepository;
    @Autowired
    private BillRepository billRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ModelMapper mapperConfig;
    @Override
    @Transactional
    public BillDetail createBillDetail(BillDetail bd, Bill bill, Long productId) {

        Product p = productService.getProductById(productId);
        if (p == null) {
            throw new AppException(ErrorException.PRODUCT_NOT_FOUND);
        }
        BillDetail billDetail = new BillDetail();
        billDetail.setQuantity(bd.getQuantity());
        billDetail.setListedPrice(bd.getListedPrice());
        billDetail.setActualSellPrice(bd.getActualSellPrice());
        billDetail.setLiftPrice(bd.getLiftPrice());
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
    @Transactional
    public BillDetailResponse createBillDetail2(BillDetailRequest request) {

        Product p = productService.getProductById(request.getProductId());
        Packaging packaging = packagingService.getPackagingById(request.getPackagingId());
        if(request.getQuantity() < 0){
            throw new AppException(ErrorException.NOT_POSITIVE);
        }
        if (p == null) {
            throw new AppException(ErrorException.PRODUCT_NOT_FOUND);
        }
        if (!p.isStorage()) {
            throw new AppException(ErrorException.PRODUCT_IS_STORAGE);
        }
        if (p.getTotalQuantity() < request.getQuantity()) {
            throw new AppException(ErrorException.NOT_ENOUGH_QUANTITY);
        }

        // Lấy hóa đơn từ billId
        Bill bill = billRepository.findById(request.getBillId())
                .orElseThrow(() -> new RuntimeException("Bill not found with ID: " + request.getBillId()));

        // Tìm BillDetail có cùng billId, productId, packagingId
        Optional<BillDetail> existingBillDetailOpt = Optional.ofNullable(billDetailRepository.findByBillIdAndProductIdAndPackagingId(
                request.getBillId(), request.getProductId(), request.getPackagingId()
        ));

        BillDetail billDetail;
        if (existingBillDetailOpt.isPresent()) {
            // Nếu đã có BillDetail, cập nhật quantity và giá
            billDetail = existingBillDetailOpt.get();
            billDetail.setQuantity(billDetail.getQuantity() + request.getQuantity());
            billDetail.setTotalProductPrice(
                   billDetail.getQuantity() * billDetail.getActualSellPrice()* packaging.getQuantityPerPackage()
            );
        } else {
            // Nếu chưa có, tạo mới
            billDetail = new BillDetail();
            billDetail.setQuantity(request.getQuantity());
            billDetail.setListedPrice(request.getListedPrice());
            billDetail.setActualSellPrice(request.getActualSellPrice());
            log.info("giá bốc vác: "+packaging.getLiftCost());
            billDetail.setLiftPrice(packaging.getLiftCost());
            billDetail.setPackaging(packaging);
            billDetail.setProduct(p);
            billDetail.setNameProduct(p.getName());
            log.info("giá tổng bốc vác: "+packaging.getLiftCost() * request.getQuantity());

            billDetail.setTotalLiftProductPrice(request.getQuantity() * billDetail.getLiftPrice());
            billDetail.setPackagingName(packaging.getPackageType());
            billDetail.setQuantityPerPackage(packaging.getQuantityPerPackage());
            billDetail.setTotalProductPrice(
                    request.getActualSellPrice() * request.getQuantity() * packaging.getQuantityPerPackage()
            );

            billDetail.setBill(bill);
        }

        BillDetail savedBillDetail = billDetailRepository.save(billDetail);

        p.setTotalQuantity(p.getTotalQuantity() - request.getQuantity()*packaging.getQuantityPerPackage());
        productRepository.save(p);

        // Chuyển đổi sang BillDetailResponse
        BillDetailResponse response = new BillDetailResponse(savedBillDetail);
        try {
            System.out.println(new ObjectMapper().writeValueAsString(response));
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        return response;
    }

    @Override
    public void deleteBillDetail(Long id) {
        BillDetail billDetail = billDetailRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorException.BILL_DETAIL_NOT_FOUND));
        Packaging p = packagingService.getPackagingById(billDetail.getPackaging().getId());
        Product product = productService.getProductById(billDetail.getProduct().getId());
        product.setTotalQuantity(product.getTotalQuantity() + billDetail.getQuantity() * p.getQuantityPerPackage());
        productRepository.save(product);
        billDetailRepository.delete(billDetail);
    }

    public void updateQuantityBillDetail(Long id, Double quantity) {
        BillDetail billDetail = billDetailRepository.findById(id).orElseThrow(() -> new AppException(ErrorException.BILL_DETAIL_NOT_FOUND));
        if(quantity < 0){
            throw new AppException(ErrorException.NOT_POSITIVE);
        }
        Packaging p = packagingService.getPackagingById(billDetail.getPackaging().getId());
        Product product = productService.getProductById(billDetail.getProduct().getId());
        double di = billDetail.getQuantity() - quantity;
        if(di*p.getQuantityPerPackage() + product.getTotalQuantity() < 0){
            throw new AppException(ErrorException.NOT_ENOUGH_QUANTITY);
        }
        product.setTotalQuantity(product.getTotalQuantity() + di* p.getQuantityPerPackage());
        productRepository.save(product);
        billDetail.setQuantity(quantity);
        billDetail.setTotalProductPrice(billDetail.getQuantity()*billDetail.getActualSellPrice()*billDetail.getQuantityPerPackage());
        billDetail.setTotalLiftProductPrice(quantity*billDetail.getLiftPrice());
        billDetailRepository.save(billDetail);
    }


    @Override
    public List<BillDetailResponse> getBillDetails(Long billId) {
        Optional<Bill> billOptional = billRepository.findById(billId);
        if (billOptional.isEmpty()) {
            throw new AppException(ErrorException.BILL_NOT_FOUND);
        }

        List<BillDetail> billDetails = billDetailRepository.findAllByBillId(billId);
        List<BillDetailResponse> result = billDetails.stream()
                .map(detail -> mapperConfig.map(detail, BillDetailResponse.class))
                .collect(Collectors.toList());
        for(int i = 0; i < result.size(); i++){
            result.get(i).setDiscount(billDetails.get(i).getListedPrice() - billDetails.get(i).getActualSellPrice());
            result.get(i).setPackageType(billDetails.get(i).getPackaging().getPackageType());
        }
        return result;
    }

    @Override
    public double getTotalPrice(Long billId) {
        return billDetailRepository.findAllByBillId(billId).stream().map(BillDetail::getTotalProductPrice).reduce(0.0, Double::sum);
    }

    @Override
    public BillDetailResponse updateActualPrice(Long billId, Double actualPrice) {
        Optional<BillDetail> billDetailOptional = billDetailRepository.findById(billId);
        if(actualPrice < 0){
            throw new AppException(ErrorException.ACTUAL_PRICE_NOT_POSITIVE);
        }
        if(billDetailOptional.isPresent()){
            BillDetail billDetail = billDetailOptional.get();
            billDetail.setActualSellPrice(actualPrice);
            billDetail.setTotalProductPrice(billDetail.getQuantity()*billDetail.getQuantityPerPackage()*actualPrice);
            billDetailRepository.save(billDetail);
            return mapperConfig.map(billDetail, BillDetailResponse.class);
        } else {
            throw new AppException(ErrorException.BILL_DETAIL_NOT_FOUND);
        }
    }

    @Override
    public BillDetailResponse createBillDetailImport(BillDetailImportRequest request) {
        Optional<Product> productOptional = productRepository.findById(request.getProductId());
        if(productOptional.isPresent()){
            Product product = productOptional.get();
            Bill bill = billRepository.findById(request.getBillId())
                    .orElseThrow(() -> new RuntimeException("Bill not found with ID: " + request.getBillId()));
            if(request.getQuantity() < 0){
                throw new AppException(ErrorException.NOT_POSITIVE);
            }
            if (request.getImportPrice() < 0){
                throw new AppException(ErrorException.ACTUAL_PRICE_NOT_POSITIVE);
            }

            BillDetail billDetail = new BillDetail();
            billDetail.setQuantity(request.getQuantity());
            billDetail.setQuantityPerPackage(1);
            billDetail.setNameProduct(product.getName());
            billDetail.setProduct(product);
            billDetail.setActualSellPrice(request.getImportPrice());
            billDetail.setBill(bill);
            billDetail.setTotalProductPrice(billDetail.getQuantity()*billDetail.getQuantityPerPackage()*request.getImportPrice());
            product.setTotalQuantity(product.getTotalQuantity() + request.getQuantity());
            productRepository.save(product);
            return mapperConfig.map(billDetailRepository.save(billDetail), BillDetailResponse.class) ;
        } else {
            throw new AppException(ErrorException.PRODUCT_NOT_FOUND);
        }

    }
}

