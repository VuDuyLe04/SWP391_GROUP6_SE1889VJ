package com.se1889_jv.swp391.swpstart.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.ListAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.Instant;

@StaticMetamodel(Packaging.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class Packaging_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#billDetails
	 **/
	public static volatile ListAttribute<Packaging, BillDetail> billDetails;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#createdAt
	 **/
	public static volatile SingularAttribute<Packaging, Instant> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#updatedBy
	 **/
	public static volatile SingularAttribute<Packaging, String> updatedBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#createdBy
	 **/
	public static volatile SingularAttribute<Packaging, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#liftCost
	 **/
	public static volatile SingularAttribute<Packaging, Double> liftCost;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#id
	 **/
	public static volatile SingularAttribute<Packaging, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#quantityPerPackage
	 **/
	public static volatile SingularAttribute<Packaging, Double> quantityPerPackage;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#storage
	 **/
	public static volatile SingularAttribute<Packaging, Boolean> storage;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#store
	 **/
	public static volatile SingularAttribute<Packaging, Store> store;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging
	 **/
	public static volatile EntityType<Packaging> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#packageType
	 **/
	public static volatile SingularAttribute<Packaging, String> packageType;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Packaging#updatedAt
	 **/
	public static volatile SingularAttribute<Packaging, Instant> updatedAt;

	public static final String BILL_DETAILS = "billDetails";
	public static final String CREATED_AT = "createdAt";
	public static final String UPDATED_BY = "updatedBy";
	public static final String CREATED_BY = "createdBy";
	public static final String LIFT_COST = "liftCost";
	public static final String ID = "id";
	public static final String QUANTITY_PER_PACKAGE = "quantityPerPackage";
	public static final String STORAGE = "storage";
	public static final String STORE = "store";
	public static final String PACKAGE_TYPE = "packageType";
	public static final String UPDATED_AT = "updatedAt";

}

