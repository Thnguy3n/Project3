package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingListConverter {
    @Autowired
    private ModelMapper modelMapper;


}
