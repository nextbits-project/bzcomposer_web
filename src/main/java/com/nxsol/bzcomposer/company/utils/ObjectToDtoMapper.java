package com.nxsol.bzcomposer.company.utils;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Component;

@Component
public class ObjectToDtoMapper {

    public <T> List<T> mapResultsToObject(List<Object[]> results, Class<T> targetClass, String[] fieldNames) {
        List<T> dtos = new ArrayList<>();

        for (Object[] result : results) {
            T dto = mapToObject(result, targetClass, fieldNames);
            dtos.add(dto);
        }

        return dtos;
    }

    private <T> T mapToObject(Object[] result, Class<T> targetClass, String[] fieldNames) {
        T dto = null;
        try {
            dto = targetClass.getDeclaredConstructor().newInstance();
            BeanUtils.populate(dto, getFieldNameValueMap(result, fieldNames));
        } catch (InstantiationException | IllegalAccessException | InvocationTargetException
                | NoSuchMethodException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }
        return dto;
    }

    private Map<String, Object> getFieldNameValueMap(Object[] result, String[] fieldNames) {
        Map<String, Object> map = new LinkedHashMap<>();

        for (int i = 0; i < result.length && i < fieldNames.length; i++) {
            map.put(fieldNames[i], result[i]);
        }

        return map;
    }
}
