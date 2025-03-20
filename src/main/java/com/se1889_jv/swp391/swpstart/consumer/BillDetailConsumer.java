package com.se1889_jv.swp391.swpstart.consumer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.se1889_jv.swp391.swpstart.config.RabbitMQConfig;
import com.se1889_jv.swp391.swpstart.controller.admin.DebtRequest;
import com.se1889_jv.swp391.swpstart.domain.*;
import com.se1889_jv.swp391.swpstart.domain.dto.ApiResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.UpdateQuantityRequest;
import com.se1889_jv.swp391.swpstart.exception.AppException;
import com.se1889_jv.swp391.swpstart.exception.ErrorException;
import com.se1889_jv.swp391.swpstart.repository.*;
import com.se1889_jv.swp391.swpstart.service.implementservice.*;
import com.se1889_jv.swp391.swpstart.util.constant.DebtTypeEnum;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;
import java.util.Optional;

@Component
@Slf4j
public class BillDetailConsumer {
    @Autowired
    private BillDetailService billDetailService;

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private DebtReceiptRepository debtReceiptRepository;
    @Autowired
    private DebtReceiptService debtReceiptService;

    @RabbitListener(queues = RabbitMQConfig.BILL_QUEUE, concurrency = "1")
    public ApiResponse<String> processBillRequest(Message message) {
        try {
            log.info("Nhận request từ queue: {}", message);

            // Lấy nội dung của message dưới dạng byte[]
            byte[] body = message.getBody();

            // Chuyển byte[] thành JSON string
            String json = new String(body, StandardCharsets.UTF_8);
            log.info("JSON nhận được: {}", json);

            // Chuyển đổi JSON thành Object
            ObjectMapper objectMapper = new ObjectMapper();

            // Xác định kiểu dữ liệu dựa trên headers của RabbitMQ
            MessageProperties properties = message.getMessageProperties();
            String typeId = (String) properties.getHeaders().get("__TypeId__");

            if ("com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest".equals(typeId)) {
                BillDetailRequest billDetailRequest = objectMapper.readValue(json, BillDetailRequest.class);
                billDetailService.createBillDetail2(billDetailRequest);
                return new ApiResponse<>(200, "Thêm thành công", null);
            }
            else if ("com.se1889_jv.swp391.swpstart.domain.dto.UpdateQuantityRequest".equals(typeId)) {
                UpdateQuantityRequest updateRequest = objectMapper.readValue(json, UpdateQuantityRequest.class);
                billDetailService.updateQuantityBillDetail(updateRequest.getBillId(), updateRequest.getQuantity());
                return new ApiResponse<>(200, "Cập nhật số lượng thành công", null);
            }

            return new ApiResponse<>(400, "Yêu cầu không hợp lệ", null);

        } catch (Exception e) {
            log.error("Lỗi khi xử lý tin nhắn từ RabbitMQ: ", e);
            return new ApiResponse<>(500, "Lỗi: " + e.getMessage(), null);
        }
    }
    @RabbitListener(queues = RabbitMQConfig.DEBT_QUEUE)
    public void processDebtRequest(DebtRequest debtRequest) {
        log.info("Nhận DebtRequest từ RabbitMQ: {}", debtRequest);
        try {
            DebtReceipt debtReceipt = debtReceiptService.getDebtReceiptById(debtRequest.getDebtId());
            log.info(debtReceipt.toString());
            if (debtReceipt.getCustomer() == null) {
                log.warn("DebtReceipt không có Customer, bỏ qua xử lý.");
                return;
            }
            Customer customer = debtReceipt.getCustomer();
            log.info(customer.toString());
            double newBalance = customer.getBalance();
            log.info(newBalance + "");
            switch (debtReceipt.getDebtType()) {
                case DEBIT:
                    newBalance += debtReceipt.getDebtAmount();
                    break;
                case DEBTREPAY:
                    newBalance -= debtReceipt.getDebtAmount();
                    break;
                default:
                    log.warn("DebtType không hợp lệ: {}", debtReceipt.getDebtType());
                    return;
            }
            log.info("đến đây rồi");
            // Đánh dấu DebtReceipt đã xử lý trước khi cập nhật số dư
            debtReceipt.setIsProcess(true);
            debtReceiptRepository.save(debtReceipt);
            log.info("đã xử lí xong 1");
            log.info(customer.toString()+ ":" + customer.getBalance());
            customer.setBalance(newBalance);
            customerRepository.save(customer);

            log.info("Cập nhật số dư thành công cho khách hàng ID: {}, Số dư mới: {}", customer.getId(), newBalance);
        } catch (Exception e) {
            log.error("Lỗi khi xử lý DebtRequest từ RabbitMQ: ", e);
        }
    }




}


