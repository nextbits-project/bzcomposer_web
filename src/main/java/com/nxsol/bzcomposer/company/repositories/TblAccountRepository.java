package com.nxsol.bzcomposer.company.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pritesh.bizcomposer.accounting.bean.TblAccount;

public interface TblAccountRepository extends JpaRepository<TblAccount,Integer>{

}