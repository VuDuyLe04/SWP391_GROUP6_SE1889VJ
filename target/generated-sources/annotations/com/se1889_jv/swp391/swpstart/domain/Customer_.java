package com.se1889_jv.swp391.swpstart.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.ListAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.Instant;

@StaticMetamodel(Customer.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class Customer_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#address
	 **/
	public static volatile SingularAttribute<Customer, String> address;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#updatedBy
	 **/
	public static volatile SingularAttribute<Customer, String> updatedBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#debtReceipts
	 **/
	public static volatile ListAttribute<Customer, DebtReceipt> debtReceipts;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#store
	 **/
	public static volatile SingularAttribute<Customer, Store> store;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#createdAt
	 **/
	public static volatile SingularAttribute<Customer, Instant> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#balance
	 **/
	public static volatile SingularAttribute<Customer, Double> balance;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#phone
	 **/
	public static volatile SingularAttribute<Customer, String> phone;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#createdBy
	 **/
	public static volatile SingularAttribute<Customer, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#name
	 **/
	public static volatile SingularAttribute<Customer, String> name;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#bills
	 **/
	public static volatile ListAttribute<Customer, Bill> bills;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#id
	 **/
	public static volatile SingularAttribute<Customer, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer
	 **/
	public static volatile EntityType<Customer> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Customer#updatedAt
	 **/
	public static volatile SingularAttribute<Customer, Instant> updatedAt;

	public static final String ADDRESS = "address";
	public static final String UPDATED_BY = "updatedBy";
	public static final String DEBT_RECEIPTS = "debtReceipts";
	public static final String STORE = "store";
	public static final String CREATED_AT = "createdAt";
	public static final String BALANCE = "balance";
	public static final String PHONE = "phone";
	public static final String CREATED_BY = "createdBy";
	public static final String NAME = "name";
	public static final String BILLS = "bills";
	public static final String ID = "id";
	public static final String UPDATED_AT = "updatedAt";

}

