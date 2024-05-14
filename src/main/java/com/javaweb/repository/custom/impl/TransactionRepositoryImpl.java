package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.custom.TransactionRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
@Repository
@PropertySource("classpath:application.properties")
@Primary
public class TransactionRepositoryImpl implements TransactionRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Value("${spring.datasource.url}")
    private String DB_URL;
    @Value("${spring.datasource.username}")
    private String USER;
    @Value("${spring.datasource.password}")
    private String PASS;
    @Override
    public List<TransactionEntity> findByCodeAndCustomerId(String code, Long id) {
        StringBuilder sql = new StringBuilder(" SELECT * FROM transaction t ");
        String join = new String(" inner join customer c on t.customerid=c.id ");
        sql.append(join);
        StringBuilder where = new StringBuilder(" where 1 = 1  ");
        where.append(" AND  t.customerid= "+id);
        where.append(" AND  t.code like'%"+code+"%'");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), TransactionEntity.class);
        return query.getResultList();
    }


}
