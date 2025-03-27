package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.DebtTypeEnum;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.Instant;

@StaticMetamodel(DebtReceipt.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class DebtReceipt_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt#createdAt
	 **/
	public static volatile SingularAttribute<DebtReceipt, Instant> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt#createdBy
	 **/
	public static volatile SingularAttribute<DebtReceipt, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt#debtReason
	 **/
	public static volatile SingularAttribute<DebtReceipt, String> debtReason;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt#id
	 **/
	public static volatile SingularAttribute<DebtReceipt, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt#isProcess
	 **/
	public static volatile SingularAttribute<DebtReceipt, Boolean> isProcess;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt
	 **/
	public static volatile EntityType<DebtReceipt> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt#debtType
	 **/
	public static volatile SingularAttribute<DebtReceipt, DebtTypeEnum> debtType;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt#debtAmount
	 **/
	public static volatile SingularAttribute<DebtReceipt, Double> debtAmount;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.DebtReceipt#customer
	 **/
	public static volatile SingularAttribute<DebtReceipt, Customer> customer;

	public static final String CREATED_AT = "createdAt";
	public static final String CREATED_BY = "createdBy";
	public static final String DEBT_REASON = "debtReason";
	public static final String ID = "id";
	public static final String IS_PROCESS = "isProcess";
	public static final String DEBT_TYPE = "debtType";
	public static final String DEBT_AMOUNT = "debtAmount";
	public static final String CUSTOMER = "customer";

}

