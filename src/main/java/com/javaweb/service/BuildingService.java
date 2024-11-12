package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface BuildingService {
    ResponseDTO listStaffs (Long buildingId);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    List<BuildingSearchResponse> getAllBuilding(Pageable pageable);
    void addOrUpdateBuilding (BuildingDTO buildingDTO) ;
    List<BuildingDTO> getBuilding(BuildingDTO buildingDTO);
    BuildingDTO findBuildingEntityById(Long Id);
    void deleteBuilding (List<Long> Id);
    void assignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
    List<BuildingDTO> getBuildingLevel1(BuildingDTO buildingDTO);
    List<BuildingDTO> getBuildingLevel2(BuildingDTO buildingDTO);
    List<BuildingDTO> getBuildingLevel3(BuildingDTO buildingDTO);
}
