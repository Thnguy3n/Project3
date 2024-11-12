package com.javaweb.service.impl;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private CustomerRepository customerRepository;


    @Override
    public void addOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity= modelMapper.map(transactionDTO,TransactionEntity.class);
        CustomerEntity customerEntity = customerRepository.findById(transactionDTO.getCustomerId()).get();
        transactionEntity.setCustomerEntity(customerEntity);
        if(transactionDTO.getId() != null){
            TransactionEntity transaction = transactionRepository.findById(transactionDTO.getId()).get();
            Date createdDate = transaction.getCreatedDate();
            String createdBy = transaction.getCreatedBy();
            transactionEntity.setCreatedDate(createdDate);
            transactionEntity.setCreatedBy(createdBy);
        }
        transactionRepository.save(transactionEntity);
    }

    @Override
    public List<TransactionDTO> addTransactions(Long customerId, String code) {
        List<TransactionEntity> transactionEntityList = transactionRepository.findByCodeAndCustomerId(code,customerId);
        List<TransactionDTO > transactionDTOS = new ArrayList<>();
        for(TransactionEntity it: transactionEntityList){
            TransactionDTO dto = modelMapper.map(it,TransactionDTO.class);
            Long customerID= it.getCustomerEntity().getId();
            dto.setCustomerId(customerID);
            Date CreateDate = it.getCreatedDate();
            Date ModifiedDate = it.getModifiedDate();
            if(CreateDate.compareTo(ModifiedDate)==0){
                dto.setModifiedDate(null);
                dto.setModifiedBy(null);
            }
            transactionDTOS.add(dto);
        }
        return transactionDTOS;
    }





}
