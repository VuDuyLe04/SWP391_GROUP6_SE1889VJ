//package com.se1889_jv.swp391.swpstart.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.redis.connection.RedisConnectionFactory;
//import org.springframework.data.redis.core.RedisTemplate;
//
//@Configuration
//public class RedisConfig {
//
//    @Bean
//    LettuceConnectionFactory connectionFactory() {
//        return new LettuceConnectionFactory();
//    }
//
//    @Bean
//    RedisTemplate<String, String> redisTemplate(RedisConnectionFactory connectionFactory) {
//
//        RedisTemplate<String, String> template = new RedisTemplate<>();
//        template.setConnectionFactory(connectionFactory);
//        return template;
//    }
//}
//
