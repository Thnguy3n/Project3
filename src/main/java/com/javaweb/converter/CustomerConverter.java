package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.StatusType;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.utils.DistrictCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;
    public CustomerSearchResponse customerSearchResponse(CustomerEntity item){
        CustomerSearchResponse customer = modelMapper.map(item,CustomerSearchResponse.class);
        Map<String,String> status = StatusType.type();
        customer.setStatus(status.get(item.getStatus()));
        return customer;
    }
}
