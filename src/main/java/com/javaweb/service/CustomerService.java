package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    List<CustomerSearchResponse> findAll (CustomerSearchRequest customerSearchRequest);
    CustomerDTO findCustomerEntityById(Long Id);
    List<CustomerSearchResponse> getAllCustomer(Pageable pageable);
    void addOrUpdateCustomer(CustomerDTO customerDTO);
    void deleteCustomer(List<Long> Id);
    ResponseDTO listStaffs (Long customerId);
    void assignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);

}
