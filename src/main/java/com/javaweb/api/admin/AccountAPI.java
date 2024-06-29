//package com.javaweb.api.admin;
//
//import com.javaweb.model.dto.AccountDTO;
//import com.javaweb.service.AccountService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController(value = "accountAPIOfAdmin")
//@RequestMapping("/api/account")
//public class AccountAPI {
//    @Autowired
//    private AccountService accountService;
//    @PostMapping
//    public AccountDTO addAccount(@RequestBody AccountDTO accountDTO) {
//        return accountService.addAccount(accountDTO);
//    }
//}
