package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.BillTypeEnum;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.ListAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.Instant;

@StaticMetamodel(Bill.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class Bill_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#billDetails
	 **/
	public static volatile ListAttribute<Bill, BillDetail> billDetails;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#note
	 **/
	public static volatile SingularAttribute<Bill, String> note;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#inDebt
	 **/
	public static volatile SingularAttribute<Bill, Double> inDebt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#totalBillPrice
	 **/
	public static volatile SingularAttribute<Bill, Double> totalBillPrice;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#billType
	 **/
	public static volatile SingularAttribute<Bill, BillTypeEnum> billType;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#store
	 **/
	public static volatile SingularAttribute<Bill, Store> store;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#createdAt
	 **/
	public static volatile SingularAttribute<Bill, Instant> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#totalLiftPrice
	 **/
	public static volatile SingularAttribute<Bill, Double> totalLiftPrice;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#createdBy
	 **/
	public static volatile SingularAttribute<Bill, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#paid
	 **/
	public static volatile SingularAttribute<Bill, Double> paid;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#id
	 **/
	public static volatile SingularAttribute<Bill, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill
	 **/
	public static volatile EntityType<Bill> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.Bill#customer
	 **/
	public static volatile SingularAttribute<Bill, Customer> customer;

	public static final String BILL_DETAILS = "billDetails";
	public static final String NOTE = "note";
	public static final String IN_DEBT = "inDebt";
	public static final String TOTAL_BILL_PRICE = "totalBillPrice";
	public static final String BILL_TYPE = "billType";
	public static final String STORE = "store";
	public static final String CREATED_AT = "createdAt";
	public static final String TOTAL_LIFT_PRICE = "totalLiftPrice";
	public static final String CREATED_BY = "createdBy";
	public static final String PAID = "paid";
	public static final String ID = "id";
	public static final String CUSTOMER = "customer";

}

