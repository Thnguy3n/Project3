package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.StringUtils;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private ModelMapper modelMapper;
    private final UploadFileUtils uploadFileUtils;
    @Autowired
    public BuildingServiceImpl(UploadFileUtils uploadFileUtils) {
        this.uploadFileUtils = uploadFileUtils;
    }
    @Override
    public ResponseDTO listStaffs(Long buildingId ) {
        BuildingEntity building= buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs= userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<AssignmentBuildingEntity> temp =building.getAssignmentBuildingEntities();
        List<UserEntity> staffAssignment = new ArrayList<>();
        for (AssignmentBuildingEntity item:temp){
            UserEntity it= userRepository.getOne(item.getUserEntity().getId());
            staffAssignment.add(it);
        }
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

    public void rent(Long buildingId){

    }
    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingEntity> building =buildingRepository.findAll(buildingSearchRequest);
        List<BuildingSearchResponse> buildingSearchResponses = new ArrayList<>();
        for(BuildingEntity it : building ){
            BuildingSearchResponse buildingSearch = buildingConverter.buildingSearchResponse(it) ;
            buildingSearchResponses.add(buildingSearch);
        }
        return buildingSearchResponses;
    }

    @Override
    public List<BuildingSearchResponse> getAllBuilding(Pageable pageable) {
        List<BuildingEntity> buildingEntities = buildingRepository.getAllBuilding(pageable);
        List<BuildingSearchResponse> results = new ArrayList<>();
        for (BuildingEntity buildingEntity : buildingEntities) {
            BuildingSearchResponse buildingSearchResponse = buildingConverter.buildingSearchResponse(buildingEntity);
            results.add(buildingSearchResponse);
        }
        return results;
    }



    @Override
        public void addOrUpdateBuilding(BuildingDTO buildingDTO) {
         BuildingEntity buildingEntity= new BuildingEntity();
        buildingEntity = modelMapper.map(buildingDTO,BuildingEntity.class);
        saveThumbnail(buildingDTO,buildingEntity);
            buildingRepository.save(buildingEntity);
         String [] a = buildingDTO.getRentArea().split(",");
        List<RentAreaEntity> rentAreaEntityList= new ArrayList<>();
        for(String it:a){
            RentAreaEntity rentArea= new RentAreaEntity();
            rentArea.setValue(Integer.parseInt(it));
            rentArea.setBuilding(buildingEntity);
            rentAreaEntityList.add(rentArea);
        }
        String [] typeList = buildingEntity.getTypeCode().split(",");
        List<String> typeCode = new ArrayList<>();
        for(String it :typeList){
            typeCode.add(it);
        }
        buildingDTO.setTypeCode(typeCode);
        List<RentAreaEntity>rentAreaEntityOldList = rentAreaRepository.findAllByBuildingEntityId(buildingDTO.getId());
        rentAreaRepository.deleteAll(rentAreaEntityOldList);
        rentAreaRepository.saveAll(rentAreaEntityList);
    }

    @Override
    public List<BuildingDTO> getBuilding(BuildingDTO buildingDTO) {
        List<BuildingEntity> buildingEntityList= buildingRepository.findAll();
        List<BuildingDTO> building = new ArrayList<>();
        for(BuildingEntity item : buildingEntityList){
            BuildingDTO b = buildingConverter.toBuidlingDTO(item);
            building.add(b);
        }
        return building;
    }

    @Override
    public BuildingDTO findBuildingEntityById(Long Id) {
        BuildingEntity buildingEntity =  buildingRepository.findById(Id).get();
        BuildingDTO buildingDTO= new BuildingDTO();
        buildingDTO=modelMapper.map(buildingEntity,BuildingDTO.class);
        List<RentAreaEntity> rentArea = buildingEntity.getRentAreaEntities();
        String areaResult = rentArea.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(areaResult);
        String [] typeList = buildingEntity.getTypeCode().split(",");
        List<String> typeCode = new ArrayList<>();
        for(String it :typeList){
            typeCode.add(it);
        }
        buildingDTO.setTypeCode(typeCode);
        return buildingDTO ;
    }

    @Override
    public void deleteBuilding(List<Long> Id) {
        List<BuildingEntity> buildingEntityList = buildingRepository.findAllById(Id) ;
        for(Long d : Id){
            List<RentAreaEntity> areaEntityList = rentAreaRepository.findAllByBuildingEntityId(d);
            rentAreaRepository.deleteAll(areaEntityList);
        }
        buildingRepository.deleteAll(buildingEntityList);
    }


    @Override
    public void assignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity= new BuildingEntity();
        buildingEntity=buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<UserEntity> userEntities = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());
        List<AssignmentBuildingEntity> assignmentBuildingEntityOldList = assignmentBuildingRepository.findAllByBuildingEntityId(buildingEntity.getId());
        assignmentBuildingRepository.deleteAll(assignmentBuildingEntityOldList);
        for(UserEntity it:userEntities){
            AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
            assignmentBuildingEntity.setBuildingEntity(buildingEntity);
            assignmentBuildingEntity.setUserEntity(it);
            assignmentBuildingRepository.save(assignmentBuildingEntity);
        }

    }

    @Override
    public List<BuildingDTO> getBuildingLevel1(BuildingDTO buildingDTO) {
        List<BuildingEntity> buildingEntityList= buildingRepository.findBuildingEntitiesByLevel("noi-bat");
        List<BuildingDTO> building = new ArrayList<>();
        for(BuildingEntity item : buildingEntityList){
            BuildingDTO b = buildingConverter.toBuidlingDTO(item);
            building.add(b);
        }
        return building;
    }

    @Override
    public List<BuildingDTO> getBuildingLevel2(BuildingDTO buildingDTO) {
        List<BuildingEntity> buildingEntityList= buildingRepository.findBuildingEntitiesByLevel("moi-nhat");
        List<BuildingDTO> building = new ArrayList<>();
        for(BuildingEntity item : buildingEntityList){
            BuildingDTO b = buildingConverter.toBuidlingDTO(item);
            building.add(b);
        }
        return building;
    }

    @Override
    public List<BuildingDTO> getBuildingLevel3(BuildingDTO buildingDTO) {
        return Collections.emptyList();
    }


    public void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C://home/office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path,bytes);
            buildingEntity.setImage(path);
        }

    }



}
