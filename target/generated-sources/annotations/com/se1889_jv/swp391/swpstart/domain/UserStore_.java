package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(UserStore.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class UserStore_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.UserStore#id
	 **/
	public static volatile SingularAttribute<UserStore, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.UserStore#store
	 **/
	public static volatile SingularAttribute<UserStore, Store> store;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.UserStore
	 **/
	public static volatile EntityType<UserStore> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.UserStore#user
	 **/
	public static volatile SingularAttribute<UserStore, User> user;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.UserStore#accessStoreStatus
	 **/
	public static volatile SingularAttribute<UserStore, UserAccessStoreStatusEnum> accessStoreStatus;

	public static final String ID = "id";
	public static final String STORE = "store";
	public static final String USER = "user";
	public static final String ACCESS_STORE_STATUS = "accessStoreStatus";

}

