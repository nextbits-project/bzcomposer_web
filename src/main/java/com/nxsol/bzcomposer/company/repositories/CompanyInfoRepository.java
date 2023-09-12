package com.nxsol.bzcomposer.company.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.File.forms.CompanyInfoDto;
//change dto to entity s
public interface CompanyInfoRepository extends JpaRepository<CompanyInfoDto,Integer>{

}
