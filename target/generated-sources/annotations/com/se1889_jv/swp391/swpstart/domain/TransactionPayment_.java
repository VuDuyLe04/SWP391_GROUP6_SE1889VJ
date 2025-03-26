package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;
import java.time.LocalDateTime;

@StaticMetamodel(TransactionPayment.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class TransactionPayment_ {

	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#date
	 **/
	public static volatile SingularAttribute<TransactionPayment, LocalDateTime> date;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#amount
	 **/
	public static volatile SingularAttribute<TransactionPayment, Integer> amount;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#transactionStatus
	 **/
	public static volatile SingularAttribute<TransactionPayment, TransactionStatus> transactionStatus;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#id
	 **/
	public static volatile SingularAttribute<TransactionPayment, Long> id;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#accountReceiver
	 **/
	public static volatile SingularAttribute<TransactionPayment, String> accountReceiver;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#gate
	 **/
	public static volatile SingularAttribute<TransactionPayment, String> gate;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment
	 **/
	public static volatile EntityType<TransactionPayment> class_;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#user
	 **/
	public static volatile SingularAttribute<TransactionPayment, User> user;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#transactionId
	 **/
	public static volatile SingularAttribute<TransactionPayment, String> transactionId;
	
	/**
	 * @see com.se1889_jv.swp391.swpstart.domain.TransactionPayment#content
	 **/
	public static volatile SingularAttribute<TransactionPayment, String> content;

	public static final String DATE = "date";
	public static final String AMOUNT = "amount";
	public static final String TRANSACTION_STATUS = "transactionStatus";
	public static final String ID = "id";
	public static final String ACCOUNT_RECEIVER = "accountReceiver";
	public static final String GATE = "gate";
	public static final String USER = "user";
	public static final String TRANSACTION_ID = "transactionId";
	public static final String CONTENT = "content";

}

