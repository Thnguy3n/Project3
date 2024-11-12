//package com.javaweb.entity;
//
//import javax.persistence.*;
//
//@Entity
//@Table(name = "account")
//public class AccountEntity extends BaseEntity{
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//    @ManyToOne
//    @JoinColumn(name = "customerId", nullable = false)
//    private CustomerEntity customerEntity;
//    @Column(name = "roleId", nullable = false)
//    private Integer roleId;
//
//    @Column(name = "username", nullable = false, length = 200)
//    private String username;
//
//    @Column(name = "password", nullable = false, length = 200)
//    private String password;
//
//    @Override
//    public Long getId() {
//        return id;
//    }
//
//    @Override
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    public CustomerEntity getCustomerEntity() {
//        return customerEntity;
//    }
//
//    public void setCustomerEntity(CustomerEntity customerEntity) {
//        this.customerEntity = customerEntity;
//    }
//
//    public Integer getRoleId() {
//        return roleId;
//    }
//
//    public void setRoleId(Integer roleId) {
//        this.roleId = roleId;
//    }
//
//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//}
