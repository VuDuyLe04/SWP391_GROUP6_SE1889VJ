package com.se1889_jv.swp391.swpstart.consumer;

import com.se1889_jv.swp391.swpstart.config.RabbitMQConfig;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest;
import com.se1889_jv.swp391.swpstart.service.implementservice.BillDetailService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BillDetailConsumer {
    @Autowired
    private BillDetailService billDetailService;
    @RabbitListener(queues = RabbitMQConfig.QUEUE_NAME)
    public void processBillDetail(BillDetailRequest request) {
        System.out.println("Processing bill detail: " + request);
        billDetailService.createBillDetail2(request);
    }
}
