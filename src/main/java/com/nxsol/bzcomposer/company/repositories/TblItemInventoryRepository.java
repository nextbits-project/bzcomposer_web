package com.nxsol.bzcomposer.company.repositories;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nxsol.bizcomposer.common.TblItemInventory;

public interface TblItemInventoryRepository extends JpaRepository<TblItemInventory,Integer>{
	
	 ArrayList<TblItemInventory> findByActiveAndCompanyIdAndParentIdOrderByInventoryCodeDesc(boolean active,int companyId,int parentId);

}