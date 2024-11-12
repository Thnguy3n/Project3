package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Value("${spring.datasource.url}")
    private String DB_URL;
    @Value("${spring.datasource.username}")
    private String USER;
    @Value("${spring.datasource.password}")
    private String PASS;
    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest) {
        StringBuilder sql = new StringBuilder("Select * From customer c ");
        StringBuilder where = new StringBuilder(" where 1 = 1");
        queryNormal(customerSearchRequest,where);
        querySpecial(customerSearchRequest,where);
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(),CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public List<CustomerEntity> getAllCustomer(Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT * FROM customer c WHERE 1 = 1 and c.is_active=1  ")
                .append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        System.out.println("Final query: " + sql.toString());
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    public static void queryNormal(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        try {
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if (!fieldName.equals("staffId")){
                    Object value = item.get(customerSearchRequest);
                    if (value != null && value!="") {
                        if (item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND c." + fieldName + "=" + value + " ");
                        } else if (item.getType().getName().equals("java.lang.String")){
                            where.append(" AND c." + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    public static void querySpecial(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        Long staffId = customerSearchRequest.getStaffId();
        if (staffId!=null) {
            where.append(" AND EXISTS (SELECT * FROM assignmentcustomer WHERE assignmentcustomer.customerid = c.id ");
            where.append(" AND assignmentcustomer.staffid = " + staffId);
            where.append(" ) ");
        }
    }
}
