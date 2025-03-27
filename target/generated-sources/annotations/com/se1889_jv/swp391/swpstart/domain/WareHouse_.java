package com.se1889_jv.swp391.swpstart.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.ListAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(WareHouse.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class WareHouse_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.WareHouse#name
	 **/
	public static volatile SingularAttribute<WareHouse, String> name;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.WareHouse#id
	 **/
	public static volatile SingularAttribute<WareHouse, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.WareHouse#store
	 **/
	public static volatile SingularAttribute<WareHouse, Store> store;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.WareHouse
	 **/
	public static volatile EntityType<WareHouse> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.WareHouse#products
	 **/
	public static volatile ListAttribute<WareHouse, Product> products;

	public static final String NAME = "name";
	public static final String ID = "id";
	public static final String STORE = "store";
	public static final String PRODUCTS = "products";

}

