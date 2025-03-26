package com.se1889_jv.swp391.swpstart.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.ListAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.Instant;

@StaticMetamodel(Product.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class Product_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#unitPrice
	 **/
	public static volatile SingularAttribute<Product, Double> unitPrice;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#billDetails
	 **/
	public static volatile ListAttribute<Product, BillDetail> billDetails;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#image
	 **/
	public static volatile SingularAttribute<Product, String> image;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#updatedBy
	 **/
	public static volatile SingularAttribute<Product, String> updatedBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#description
	 **/
	public static volatile SingularAttribute<Product, String> description;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#storage
	 **/
	public static volatile SingularAttribute<Product, Boolean> storage;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#store
	 **/
	public static volatile SingularAttribute<Product, Store> store;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#warehouse
	 **/
	public static volatile SingularAttribute<Product, WareHouse> warehouse;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#createdAt
	 **/
	public static volatile SingularAttribute<Product, Instant> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#totalQuantity
	 **/
	public static volatile SingularAttribute<Product, Double> totalQuantity;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#createdBy
	 **/
	public static volatile SingularAttribute<Product, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#name
	 **/
	public static volatile SingularAttribute<Product, String> name;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#id
	 **/
	public static volatile SingularAttribute<Product, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#category
	 **/
	public static volatile SingularAttribute<Product, String> category;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product
	 **/
	public static volatile EntityType<Product> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Product#updatedAt
	 **/
	public static volatile SingularAttribute<Product, Instant> updatedAt;

	public static final String UNIT_PRICE = "unitPrice";
	public static final String BILL_DETAILS = "billDetails";
	public static final String IMAGE = "image";
	public static final String UPDATED_BY = "updatedBy";
	public static final String DESCRIPTION = "description";
	public static final String STORAGE = "storage";
	public static final String STORE = "store";
	public static final String WAREHOUSE = "warehouse";
	public static final String CREATED_AT = "createdAt";
	public static final String TOTAL_QUANTITY = "totalQuantity";
	public static final String CREATED_BY = "createdBy";
	public static final String NAME = "name";
	public static final String ID = "id";
	public static final String CATEGORY = "category";
	public static final String UPDATED_AT = "updatedAt";

}

