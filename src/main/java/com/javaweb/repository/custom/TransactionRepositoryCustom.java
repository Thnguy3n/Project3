package com.javaweb.repository.custom;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface TransactionRepositoryCustom {
    List<TransactionEntity> findByCodeAndCustomerId(String code, Long id);
}
