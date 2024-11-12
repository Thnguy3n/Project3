package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

public enum StatusType {
    DANG_XU_LY("Đang xử lý"),
    CHUA_XU_LY("Chưa xử lý"),
    DA_XU_LY_XONG("Đã xử lý xong");
    private  final String  name ;
    StatusType(String name) {
        this.name = name;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new TreeMap<>();
        for(StatusType item : StatusType.values()){
            listType.put(item.toString() , item.name);
        }
        return listType;
    }
}


