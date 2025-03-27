package com.se1889_jv.swp391.swpstart.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.ListAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.Instant;

@StaticMetamodel(Service.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class Service_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#createdAt
	 **/
	public static volatile SingularAttribute<Service, Instant> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#durationMonths
	 **/
	public static volatile SingularAttribute<Service, Integer> durationMonths;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#updatedBy
	 **/
	public static volatile SingularAttribute<Service, String> updatedBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#createdBy
	 **/
	public static volatile SingularAttribute<Service, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#price
	 **/
	public static volatile SingularAttribute<Service, Double> price;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#name
	 **/
	public static volatile SingularAttribute<Service, String> name;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#description
	 **/
	public static volatile SingularAttribute<Service, String> description;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#active
	 **/
	public static volatile SingularAttribute<Service, Boolean> active;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#transactionServices
	 **/
	public static volatile ListAttribute<Service, TransactionService> transactionServices;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#id
	 **/
	public static volatile SingularAttribute<Service, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service
	 **/
	public static volatile EntityType<Service> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Service#updatedAt
	 **/
	public static volatile SingularAttribute<Service, Instant> updatedAt;

	public static final String CREATED_AT = "createdAt";
	public static final String DURATION_MONTHS = "durationMonths";
	public static final String UPDATED_BY = "updatedBy";
	public static final String CREATED_BY = "createdBy";
	public static final String PRICE = "price";
	public static final String NAME = "name";
	public static final String DESCRIPTION = "description";
	public static final String ACTIVE = "active";
	public static final String TRANSACTION_SERVICES = "transactionServices";
	public static final String ID = "id";
	public static final String UPDATED_AT = "updatedAt";

}

