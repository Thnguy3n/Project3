package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private TransactionService transactionService;
    @PostMapping
    public CustomerDTO addAccount(@RequestBody CustomerDTO customerDTO){
        customerService.addAccount(customerDTO);
        return customerDTO;
    }
//    @PostMapping
//    public CustomerDTO addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
//        customerService.addOrUpdateCustomer(customerDTO);
//        return customerDTO;
//    }

    @DeleteMapping("/{ids}")
    public void DeleteCustomer(@PathVariable List<Long> ids){
        customerService.deleteCustomer(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }

    @PostMapping("/assignment")
    public void updateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.assignmentCustomer(assignmentCustomerDTO);
    }

    @PostMapping("/transaction")
    public void addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO){
        transactionService.addOrUpdateTransaction(transactionDTO);
    }
}
