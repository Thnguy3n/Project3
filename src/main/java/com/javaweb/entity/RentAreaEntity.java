package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "rentarea")
public class RentAreaEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name="value")
    private Integer value;

    @ManyToOne
    @JoinColumn(name ="buildingid")
    private BuildingEntity buildingEntity;

    public BuildingEntity getBuilding() {
        return buildingEntity;
    }

    public void setBuilding(BuildingEntity building) {
        this.buildingEntity = building;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

}
