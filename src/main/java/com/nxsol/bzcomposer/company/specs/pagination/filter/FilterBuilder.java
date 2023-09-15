package com.nxsol.bzcomposer.company.specs.pagination.filter;


import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;


public class FilterBuilder {

    private FilterBuilder(){

    }

    private static List<String> split(String search, String delimiter) {
        return Stream.of(search.split(delimiter))
                //.map (elem -> new String(elem))
                .collect(Collectors.toList());
    }


    public static List<FilterCondition> getFilters(String searchCriteria) {

        List<FilterCondition> filters = new ArrayList<>();

        if (searchCriteria != null && !searchCriteria.isEmpty()) {

            List<String> values = split(searchCriteria, "&");
            if (!values.isEmpty()) {
                values.forEach(x -> {
                    List<String> filter = split(x, "\\|");

                    if(FilterOperation.fromValue(filter.get(1)) != null){
                        filters.add(new FilterCondition(filter.get(0), FilterOperation.fromValue(filter.get(1)), filter.get(2)));
                    }

                });
            }
        }

        return filters;

    }




}
