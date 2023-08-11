package com.nxsol.bzcomposer.company.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nxsol.bizcomposer.common.TblInventoryUnitMeasure;

public interface TblInventoryUnitMeasureRepository extends JpaRepository<TblInventoryUnitMeasure,Integer>{

	TblInventoryUnitMeasure findByInventoryIDAndCompanyID(int inventoryID,int CompanyID); 
}