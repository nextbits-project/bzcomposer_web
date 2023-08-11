package com.nxsol.bzcomposer.company.repositories;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nxsol.bizcomposer.common.TblClientVendorService;

public interface TblClientVendorServiceRepository extends JpaRepository<TblClientVendorService,Integer>{
	
	ArrayList<TblClientVendorService> findByCompanyIdAndClientVendorID(int CompanyID, int ClientVendorID);

}