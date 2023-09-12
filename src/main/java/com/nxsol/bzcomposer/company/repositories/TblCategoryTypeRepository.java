package com.nxsol.bzcomposer.company.repositories;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nxsol.bizcomposer.common.TblCategoryType;

public interface TblCategoryTypeRepository extends JpaRepository<TblCategoryType,Integer>{
	
	ArrayList<TblCategoryType> findByIsActiveOrderByCategoryTypeNameAsc(boolean lastName);

}