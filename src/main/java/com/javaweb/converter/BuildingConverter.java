package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.DistrictCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingSearchResponse buildingSearchResponse(BuildingEntity item) {
        BuildingSearchResponse building = modelMapper.map(item, BuildingSearchResponse.class);
        Map<String,String> district = DistrictCode.type();
        building.setAddress(item.getStreet() + ", " + item.getWard()+","+district.get(item.getDistrict()));
        List<RentAreaEntity> rentArea = item.getRentAreaEntities();
        String areaResult = rentArea.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        building.setRentArea(areaResult);
        return building;
    }
    public  BuildingDTO toBuidlingDTO(BuildingEntity item){
        BuildingDTO buildingDTO=modelMapper.map(item,BuildingDTO.class);
        Map<String,String> district = DistrictCode.type();
        buildingDTO.setAddress(item.getStreet() + ", " + item.getWard()+","+district.get(item.getDistrict()));
        List<RentAreaEntity> rentArea = item.getRentAreaEntities();
        String areaResult = rentArea.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(areaResult);
        String [] typeList = item.getTypeCode().split(",");
        List<String> typeCode = new ArrayList<>();
        for(String it :typeList){
            Map<String,String > type =buildingType.type();
            String typeValue = type.get(it.toString());
            typeCode.add(typeValue  );
        }
        buildingDTO.setTypeCode(typeCode);
        return  buildingDTO;
    }
}
