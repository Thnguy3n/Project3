package com.javaweb.service.impl;

import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.*;
import com.javaweb.model.dto.AccountDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.RoleRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CustomerConverter customerConverter;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Override
    public List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest) {
        List<CustomerEntity> customer =customerRepository.findAll(customerSearchRequest);
        List<CustomerSearchResponse> customerSearchResponses = new ArrayList<>();
        for(CustomerEntity it : customer ){
            if(it.getIsActive()==1){
                CustomerSearchResponse customerResponse = customerConverter.customerSearchResponse(it) ;
                customerSearchResponses.add(customerResponse);
            }
        }
        return customerSearchResponses;
    }

    @Override
    public CustomerDTO findCustomerEntityById(Long Id) {
        CustomerEntity customerEntity = customerRepository.findById(Id).get();
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO= modelMapper.map(customerEntity,CustomerDTO.class);
        return customerDTO;
    }

    @Override
    public List<CustomerSearchResponse> getAllCustomer(Pageable pageable) {
        List<CustomerEntity> customerEntities = customerRepository.getAllCustomer(pageable);
        List<CustomerSearchResponse> results = new ArrayList<>();
        for (CustomerEntity customerEntity : customerEntities) {
            CustomerSearchResponse customerSearchResponse = customerConverter.customerSearchResponse(customerEntity);
            results.add(customerSearchResponse);
        }
        return results;
    }

    @Override
    public void addOrUpdateCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity=modelMapper.map(customerDTO,CustomerEntity.class);
        if(customerDTO.getStatus() == null || customerDTO.getStatus().isEmpty()){
            customerEntity.setStatus("CHUA_XU_LY");
        }
        customerRepository.save(customerEntity);
    }

    @Override
    public void deleteCustomer(List<Long> Id) {
        List<CustomerEntity> customerEntityList= customerRepository.findAllById(Id);
        for(CustomerEntity cus: customerEntityList){
            cus.setIsActive(0);
            customerEntityList.add(cus);
            customerRepository.saveAll(customerEntityList);
        }
    }

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customer= customerRepository.findById(customerId).get();
        List<UserEntity> staffs= userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment = customer.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS= new ArrayList<>();
        ResponseDTO responseDTO= new ResponseDTO();
        for(UserEntity it:staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if (staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public void assignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> userEntities = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
        for (UserEntity user : customerEntity.getUserEntities()) {
            user.getCustomerEntityList().remove(customerEntity);
            userRepository.save(user);
        }
        customerEntity.getUserEntities().clear();
        customerRepository.save(customerEntity);
        for (UserEntity user : userEntities) {
            customerEntity.getUserEntities().add(user);
            user.getCustomerEntityList().add(customerEntity);
            userRepository.save(user);
        }
        customerRepository.save(customerEntity);
    }

//    @Override
//    public void addAccount(CustomerDTO customerDTO) {
//        CustomerEntity customerEntity= modelMapper.map(customerDTO,CustomerEntity.class);
//        customerEntity.setPassword(passwordEncoder.encode(SystemConstant.PASSWORD_DEFAULT));
//        if(customerDTO.getStatus() == null || customerDTO.getStatus().isEmpty()){
//            customerEntity.setStatus("CHUA_XU_LY");
//        }
//        customerEntity.setRole("CUSTOMER");
//        customerRepository.save(customerEntity);
//    }




}
