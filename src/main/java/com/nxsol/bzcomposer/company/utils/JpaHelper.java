package com.nxsol.bzcomposer.company.utils;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class JpaHelper {

    /**
     * helper for adding parameters to jpa-query;
     */
    public static <T> void addParameter(TypedQuery<T> jpaQuery, String query, String jpaParameterKey, Object jpaParameter) {
        JpaHelper.addParameter((Query)jpaQuery, query, jpaParameterKey, jpaParameter);
    }

    /**
     * helper for adding parameters to jpa-query;
     */
    public static void addParameter(Query jpaQuery, String query, String jpaParameterKey, Object jpaParameter) {
        if(jpaQuery != null &&
           query != null &&
           jpaParameterKey != null &&
           (query.contains(":" + jpaParameterKey + " ") ||
            query.contains(":" + jpaParameterKey + ")") ||
            query.contains(":" + jpaParameterKey + ",") ||
            query.contains(":" + jpaParameterKey + "\n") ||
            query.endsWith(":" + jpaParameterKey)) ) {

            jpaQuery.setParameter(jpaParameterKey, jpaParameter);
        }
    }

}
