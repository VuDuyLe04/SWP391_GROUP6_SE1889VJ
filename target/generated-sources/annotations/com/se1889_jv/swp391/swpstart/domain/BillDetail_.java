package com.se1889_jv.swp391.swpstart.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.LocalDateTime;

@StaticMetamodel(BillDetail.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class BillDetail_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#actualSellPrice
	 **/
	public static volatile SingularAttribute<BillDetail, Double> actualSellPrice;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#product
	 **/
	public static volatile SingularAttribute<BillDetail, Product> product;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#quantity
	 **/
	public static volatile SingularAttribute<BillDetail, Double> quantity;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#bill
	 **/
	public static volatile SingularAttribute<BillDetail, Bill> bill;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#packaging
	 **/
	public static volatile SingularAttribute<BillDetail, Packaging> packaging;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#quantityPerPackage
	 **/
	public static volatile SingularAttribute<BillDetail, Double> quantityPerPackage;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#packagingName
	 **/
	public static volatile SingularAttribute<BillDetail, String> packagingName;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#totalLiftProductPrice
	 **/
	public static volatile SingularAttribute<BillDetail, Double> totalLiftProductPrice;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#createdAt
	 **/
	public static volatile SingularAttribute<BillDetail, LocalDateTime> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#createdBy
	 **/
	public static volatile SingularAttribute<BillDetail, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#totalProductPrice
	 **/
	public static volatile SingularAttribute<BillDetail, Double> totalProductPrice;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#liftPrice
	 **/
	public static volatile SingularAttribute<BillDetail, Double> liftPrice;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#id
	 **/
	public static volatile SingularAttribute<BillDetail, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#listedPrice
	 **/
	public static volatile SingularAttribute<BillDetail, Double> listedPrice;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail
	 **/
	public static volatile EntityType<BillDetail> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.BillDetail#nameProduct
	 **/
	public static volatile SingularAttribute<BillDetail, String> nameProduct;

	public static final String ACTUAL_SELL_PRICE = "actualSellPrice";
	public static final String PRODUCT = "product";
	public static final String QUANTITY = "quantity";
	public static final String BILL = "bill";
	public static final String PACKAGING = "packaging";
	public static final String QUANTITY_PER_PACKAGE = "quantityPerPackage";
	public static final String PACKAGING_NAME = "packagingName";
	public static final String TOTAL_LIFT_PRODUCT_PRICE = "totalLiftProductPrice";
	public static final String CREATED_AT = "createdAt";
	public static final String CREATED_BY = "createdBy";
	public static final String TOTAL_PRODUCT_PRICE = "totalProductPrice";
	public static final String LIFT_PRICE = "liftPrice";
	public static final String ID = "id";
	public static final String LISTED_PRICE = "listedPrice";
	public static final String NAME_PRODUCT = "nameProduct";

}

