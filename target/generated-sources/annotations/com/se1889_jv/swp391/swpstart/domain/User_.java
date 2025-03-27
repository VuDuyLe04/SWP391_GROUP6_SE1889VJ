package com.se1889_jv.swp391.swpstart.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.ListAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.Instant;

@StaticMetamodel(User.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class User_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#transactionPayments
	 **/
	public static volatile ListAttribute<User, TransactionPayment> transactionPayments;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#updatedBy
	 **/
	public static volatile SingularAttribute<User, String> updatedBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#role
	 **/
	public static volatile SingularAttribute<User, Role> role;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#active
	 **/
	public static volatile SingularAttribute<User, Boolean> active;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#transactionServices
	 **/
	public static volatile ListAttribute<User, TransactionService> transactionServices;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#renewalDate
	 **/
	public static volatile SingularAttribute<User, Instant> renewalDate;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#createdAt
	 **/
	public static volatile SingularAttribute<User, Instant> createdAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#password
	 **/
	public static volatile SingularAttribute<User, String> password;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#balance
	 **/
	public static volatile SingularAttribute<User, Double> balance;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#phone
	 **/
	public static volatile SingularAttribute<User, String> phone;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#createdBy
	 **/
	public static volatile SingularAttribute<User, String> createdBy;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#statusService
	 **/
	public static volatile SingularAttribute<User, Boolean> statusService;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#name
	 **/
	public static volatile SingularAttribute<User, String> name;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#userStores
	 **/
	public static volatile ListAttribute<User, UserStore> userStores;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#id
	 **/
	public static volatile SingularAttribute<User, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User
	 **/
	public static volatile EntityType<User> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#updatedAt
	 **/
	public static volatile SingularAttribute<User, Instant> updatedAt;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.User#expirationDate
	 **/
	public static volatile SingularAttribute<User, Instant> expirationDate;

	public static final String TRANSACTION_PAYMENTS = "transactionPayments";
	public static final String UPDATED_BY = "updatedBy";
	public static final String ROLE = "role";
	public static final String ACTIVE = "active";
	public static final String TRANSACTION_SERVICES = "transactionServices";
	public static final String RENEWAL_DATE = "renewalDate";
	public static final String CREATED_AT = "createdAt";
	public static final String PASSWORD = "password";
	public static final String BALANCE = "balance";
	public static final String PHONE = "phone";
	public static final String CREATED_BY = "createdBy";
	public static final String STATUS_SERVICE = "statusService";
	public static final String NAME = "name";
	public static final String USER_STORES = "userStores";
	public static final String ID = "id";
	public static final String UPDATED_AT = "updatedAt";
	public static final String EXPIRATION_DATE = "expirationDate";

}

