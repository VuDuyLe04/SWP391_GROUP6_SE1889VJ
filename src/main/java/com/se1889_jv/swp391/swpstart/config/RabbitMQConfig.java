package com.se1889_jv.swp391.swpstart.config;

import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class RabbitMQConfig {

    public static final String BILL_QUEUE = "BILL_QUEUE";
    public static final String DEBT_QUEU = "DEBT_QUEU";
    @Bean
    public Jackson2JsonMessageConverter jsonMessageConverter() {
        return new Jackson2JsonMessageConverter();
    }
    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory) {
        RabbitTemplate  template = new RabbitTemplate(connectionFactory);
        template.setMessageConverter(jsonMessageConverter());
        return template;
    }




    @Bean
    public Queue billQueue() {
        Map<String, Object> args = new HashMap<>();
        args.put("x-max-priority", 1);
        return new Queue(BILL_QUEUE, true, false, false, args);
    }
    @Bean
    public Queue debtQueue() {
        Map<String, Object> args = new HashMap<>();
        args.put("x-max-priority", 1);
        return new Queue(DEBT_QUEU, true, false, false, args);
    }

}
