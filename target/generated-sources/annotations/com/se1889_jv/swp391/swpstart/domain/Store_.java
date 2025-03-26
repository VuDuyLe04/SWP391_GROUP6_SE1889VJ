package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.StatusStoreEnum;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.ListAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.Instant;

@StaticMetamodel(Store.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class Store_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#address
	 **/
	public static volatile SingularAttribute<Store, String> address;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#updatedBy
	 **/
	public static volatile SingularAttribute<Store, String> updatedBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#wareHouses
	 **/
	public static volatile ListAttribute<Store, WareHouse> wareHouses;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#products
	 **/
	public static volatile ListAttribute<Store, Product> products;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#createdAt
	 **/
	public static volatile SingularAttribute<Store, Instant> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#packagings
	 **/
	public static volatile ListAttribute<Store, Packaging> packagings;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#createdBy
	 **/
	public static volatile SingularAttribute<Store, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#name
	 **/
	public static volatile SingularAttribute<Store, String> name;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#userStores
	 **/
	public static volatile ListAttribute<Store, UserStore> userStores;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#bills
	 **/
	public static volatile ListAttribute<Store, Bill> bills;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#id
	 **/
	public static volatile SingularAttribute<Store, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#customers
	 **/
	public static volatile ListAttribute<Store, Customer> customers;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store
	 **/
	public static volatile EntityType<Store> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#updatedAt
	 **/
	public static volatile SingularAttribute<Store, Instant> updatedAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Store#status
	 **/
	public static volatile SingularAttribute<Store, StatusStoreEnum> status;

	public static final String ADDRESS = "address";
	public static final String UPDATED_BY = "updatedBy";
	public static final String WARE_HOUSES = "wareHouses";
	public static final String PRODUCTS = "products";
	public static final String CREATED_AT = "createdAt";
	public static final String PACKAGINGS = "packagings";
	public static final String CREATED_BY = "createdBy";
	public static final String NAME = "name";
	public static final String USER_STORES = "userStores";
	public static final String BILLS = "bills";
	public static final String ID = "id";
	public static final String CUSTOMERS = "customers";
	public static final String UPDATED_AT = "updatedAt";
	public static final String STATUS = "status";

}

