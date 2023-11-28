package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCctype;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaCctypeRepository extends JpaRepository<BcaCctype, Integer> {
	
    List<BcaCctype> findByCompany_CompanyIdAndActive(Long companyId, Integer active);
}
