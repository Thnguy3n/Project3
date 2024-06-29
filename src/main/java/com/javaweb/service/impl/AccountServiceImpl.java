//package com.javaweb.service.impl;
//
//import com.javaweb.entity.AccountEntity;
//import com.javaweb.entity.RoleEntity;
//import com.javaweb.model.dto.AccountDTO;
//import com.javaweb.repository.AccountRepository;
//import com.javaweb.repository.RoleRepository;
//import com.javaweb.service.AccountService;
//import org.modelmapper.ModelMapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Service;
//
//@Service
//public class AccountServiceImpl implements AccountService {
//    @Autowired
//    private RoleRepository roleRepository;
//    @Autowired
//    private ModelMapper modelMapper;
//    @Autowired
//    private BCryptPasswordEncoder passwordEncoder;
//    @Autowired
//    private AccountRepository accountRepository;
//    @Override
//    public AccountDTO addAccount(AccountDTO accountDTO) {
//        AccountEntity accountEntity=modelMapper.map(accountDTO, AccountEntity.class);
//        accountEntity.setRoleId(3);
//        accountEntity.setPassword(passwordEncoder.encode(accountDTO.getPassword()));
//        accountRepository.save(accountEntity);
//        return modelMapper.map(accountEntity, AccountDTO.class);
//
//    }
//}
