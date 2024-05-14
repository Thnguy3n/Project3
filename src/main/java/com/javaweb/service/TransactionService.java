package com.javaweb.service;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface TransactionService {
    void addOrUpdateTransaction(TransactionDTO transactionDTO);
    List<TransactionDTO> addTransactions(Long customerId,String code);
}
