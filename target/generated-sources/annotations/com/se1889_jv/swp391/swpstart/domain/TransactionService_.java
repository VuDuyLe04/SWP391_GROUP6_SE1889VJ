package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.LocalDateTime;

@StaticMetamodel(TransactionService.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class TransactionService_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService#durationMonths
	 **/
	public static volatile SingularAttribute<TransactionService, Integer> durationMonths;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService#amount
	 **/
	public static volatile SingularAttribute<TransactionService, Double> amount;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService#transactionStatus
	 **/
	public static volatile SingularAttribute<TransactionService, TransactionStatus> transactionStatus;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService#service
	 **/
	public static volatile SingularAttribute<TransactionService, Service> service;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService#id
	 **/
	public static volatile SingularAttribute<TransactionService, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService#serviceName
	 **/
	public static volatile SingularAttribute<TransactionService, String> serviceName;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService#transactionDate
	 **/
	public static volatile SingularAttribute<TransactionService, LocalDateTime> transactionDate;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService
	 **/
	public static volatile EntityType<TransactionService> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionService#user
	 **/
	public static volatile SingularAttribute<TransactionService, User> user;

	public static final String DURATION_MONTHS = "durationMonths";
	public static final String AMOUNT = "amount";
	public static final String TRANSACTION_STATUS = "transactionStatus";
	public static final String SERVICE = "service";
	public static final String ID = "id";
	public static final String SERVICE_NAME = "serviceName";
	public static final String TRANSACTION_DATE = "transactionDate";
	public static final String USER = "user";

}

