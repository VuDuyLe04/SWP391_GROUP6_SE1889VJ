package com.se1889_jv.swp391.swpstart.consumer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.se1889_jv.swp391.swpstart.config.RabbitMQConfig;
import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Packaging;
import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.dto.ApiResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.UpdateQuantityRequest;
import com.se1889_jv.swp391.swpstart.exception.AppException;
import com.se1889_jv.swp391.swpstart.exception.ErrorException;
import com.se1889_jv.swp391.swpstart.repository.BillDetailRepository;
import com.se1889_jv.swp391.swpstart.repository.BillRepository;
import com.se1889_jv.swp391.swpstart.repository.ProductRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.BillDetailService;
import com.se1889_jv.swp391.swpstart.service.implementservice.PackagingService;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
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



}


