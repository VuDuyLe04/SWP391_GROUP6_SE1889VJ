package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.DebtReceipt;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailImportRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.ImportRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.request.DebtReceiptCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.DebtReceiptCreationResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.DebtReceiptDetailResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.PageResponse;
import com.se1889_jv.swp391.swpstart.exception.AppException;
import com.se1889_jv.swp391.swpstart.exception.ErrorException;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.repository.DebtReceiptRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IDebtReceiptService;
import com.se1889_jv.swp391.swpstart.service.implementservice.specification.DebtReceiptSpecification;
import com.se1889_jv.swp391.swpstart.util.constant.DebtTypeEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class DebtReceiptService implements IDebtReceiptService {
    @Autowired
    private DebtReceiptRepository debtReceiptRepository;
    @Autowired
    private  CustomerRepository customerRepository;
    @Autowired
    private CustomerService customerService;
    @Override
    public PageResponse<DebtReceipt> getDebtsByCustomer(long id, int page) {
        var customer = customerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Customer not found"));
        Pageable pageable = PageRequest.of(page - 1, 5, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<DebtReceipt> debtReceipts = debtReceiptRepository.findByCustomer(customer, pageable);

        List<DebtReceipt> debtReceiptList = debtReceipts.getContent();

        return PageResponse.<DebtReceipt>builder()
                .currentPage(page)
                .pageSize(debtReceipts.getTotalPages())
                .totalElements(debtReceipts.getTotalElements())
                .totalPages(debtReceipts.getTotalPages())
                .data(debtReceiptList)
                .build();
    }

    public DebtReceipt getDebtReceiptById(long id) {
        return debtReceiptRepository.findById(id).get();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public DebtReceiptCreationResponse createDebtReceipt(DebtReceiptCreationRequest request) {
        Customer customer = customerRepository.findByIdWithLock(request.getCustomerId())
                .orElseThrow(()->new RuntimeException("Customer not found"));
        log.info("amount {}", request.getDebtAmount());

        double debit = debtReceiptRepository.findByCustomer(customer)
                .stream().filter(d -> d.getDebtType() == DebtTypeEnum.DEBIT).mapToDouble(DebtReceipt::getDebtAmount)
                .sum();

        double debtrepay = debtReceiptRepository.findByCustomer(customer)
                .stream().filter(d -> d.getDebtType() == DebtTypeEnum.DEBTREPAY).mapToDouble(DebtReceipt::getDebtAmount)
                .sum();

        double sum = debit - debtrepay;
        log.info("Sum {}", sum);

        if(request.getDebtType() == DebtTypeEnum.DEBIT) {
            sum = sum + request.getDebtAmount();
        } else if(request.getDebtType() == DebtTypeEnum.DEBTREPAY) {
            sum = sum - request.getDebtAmount();
        }
        log.info("Sum {}", sum);

        DebtReceipt debtReceipt =  DebtReceipt.builder()
                .debtType(request.getDebtType())
                .debtAmount(request.getDebtAmount())
                .debtReason(request.getDebtReason())
                .createdAt(Instant.now())
                .customer(customer)
                .createdBy(request.getCreatedBy())
                .build();

        debtReceiptRepository.save(debtReceipt);
        customer.setBalance(sum);
        customerRepository.save(customer);
        return DebtReceiptCreationResponse.builder()
                .id(debtReceipt.getId())
                .debtAmount(debtReceipt.getDebtAmount())
                .totalAmount(sum)
                .debtReason(debtReceipt.getDebtReason())
                .createdAt(debtReceipt.getCreatedAt())
                .createdBy(debtReceipt.getCreatedBy())
                .build();
    }

    @Override
    public PageResponse<DebtReceiptDetailResponse> getAllWithSearch(Long customerId, int page, Instant from, Instant to, Double debtAmount) {
        customerRepository.findById(customerId)
                .orElseThrow(() -> new RuntimeException("Customer not found"));
        Pageable pageable;

        Specification<DebtReceipt> specification = DebtReceiptSpecification.findByCustomer(customerId);
        if(debtAmount != null) {
            pageable = PageRequest.of(page - 1, 5, Sort.by(Sort.Direction.ASC, "debtAmount"));
            specification = specification.and(DebtReceiptSpecification.findByDebtAmount(debtAmount));
        } else {
            pageable = PageRequest.of(page - 1, 5, Sort.by(Sort.Direction.DESC, "createdAt"));
        }
        if (from != null && to != null) {
            specification = specification.and(DebtReceiptSpecification.findByCreatedAtBetween(from, to));
        }
        if(from == null && to != null) {
            specification = specification.and(DebtReceiptSpecification.findByCreatedAtBefore(to));
        }
        if(from != null && to == null) {
            to = Instant.now().truncatedTo(ChronoUnit.SECONDS);
            specification = specification.and(DebtReceiptSpecification.findByCreatedAtBetween(from, to));
        }

        Page<DebtReceipt> pageData = debtReceiptRepository.findAll(specification, pageable);

        List<DebtReceiptDetailResponse> debtReceiptList = pageData.getContent()
                .stream().map(deb -> {
                    Instant createdAt = deb.getCreatedAt();
                    LocalDate dateTime = LocalDate.ofInstant(createdAt, ZoneOffset.UTC);
                    return DebtReceiptDetailResponse.builder()
                            .id(deb.getId())
                            .customerName(deb.getCustomer().getName())
                            .debtAmount(deb.getDebtAmount())
                            .debtReason(deb.getDebtReason())
                            .totalAmount(deb.getCustomer().getBalance())
                            .createdAt(dateTime)
                            .debtType(String.valueOf(deb.getDebtType()))
                            .createdBy(deb.getCreatedBy())
                            .build();
                }).toList();

        return PageResponse.<DebtReceiptDetailResponse>builder()
                .currentPage(page)
                .pageSize(pageable.getPageSize())
                .totalPages(pageData.getTotalPages())
                .totalElements(pageData.getTotalElements())
                .data(debtReceiptList)
                .build();
    }

    @Override
    public DebtReceipt createDebtReceiption(BillRequest request, User user) {
        if(request.getCustomerInfor().isEmpty() || request.getCustomerInfor() == null) {
            throw new AppException(ErrorException.DEBT_DONT_HAVE_CUSTOMER);
        }
        DebtReceipt debtReceipt = new DebtReceipt();
        if(request.getActualPay() < request.getTotalNeedPay()){
            debtReceipt.setDebtAmount(request.getTotalNeedPay() - request.getActualPay());
            debtReceipt.setDebtType(DebtTypeEnum.DEBIT);

        } else if(request.getActualPay() > request.getTotalNeedPay()){
            debtReceipt.setDebtAmount(request.getActualPay() - request.getTotalNeedPay());
            debtReceipt.setDebtType(DebtTypeEnum.DEBTREPAY);
        } else if (request.getActualPay().equals(request.getTotalNeedPay())) {
            Customer c = customerService.getCustomerByNameAndPhone(request.getCustomerInfor());
            debtReceipt.setDebtAmount(c.getBalance());
            debtReceipt.setDebtType(DebtTypeEnum.DEBTREPAY);
        }
        debtReceipt.setCustomer(customerService.getCustomerByNameAndPhone(request.getCustomerInfor()));
        debtReceipt.setCreatedBy(user.getName());
        debtReceipt.setIsProcess(false);
        return debtReceiptRepository.save(debtReceipt);
    }

    @Override
    public DebtReceipt createDebtForImport(ImportRequest request, User user) {
        if(request.getCustomerInfor().isEmpty() || request.getCustomerInfor() == null) {
            throw new AppException(ErrorException.DEBT_DONT_HAVE_CUSTOMER);
        }
        DebtReceipt debtReceipt = new DebtReceipt();
        if(request.getActualPay() < request.getTotalNeedPay()){
            debtReceipt.setDebtAmount(request.getTotalNeedPay() - request.getActualPay());
            debtReceipt.setDebtType(DebtTypeEnum.DEBTREPAY);
        } else if(request.getActualPay() > request.getTotalNeedPay()){
            debtReceipt.setDebtAmount(request.getActualPay() - request.getTotalNeedPay());
            debtReceipt.setDebtType(DebtTypeEnum.DEBIT);
        } else if (request.getActualPay().equals(request.getTotalNeedPay())) {
            Customer c = customerService.getCustomerByNameAndPhone(request.getCustomerInfor());
            debtReceipt.setDebtAmount(c.getBalance());
            debtReceipt.setDebtType(DebtTypeEnum.DEBIT);
        }
        debtReceipt.setCustomer(customerService.getCustomerByNameAndPhone(request.getCustomerInfor()));
        debtReceipt.setCreatedBy(user.getName());
        debtReceipt.setIsProcess(false);
        return debtReceiptRepository.save(debtReceipt);
    }


}
