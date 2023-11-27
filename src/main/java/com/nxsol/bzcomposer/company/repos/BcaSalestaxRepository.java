package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaSalestax;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaSalestaxRepository extends JpaRepository<BcaSalestax, Integer> {
	List<BcaSalestax> findByCompany_CompanyIdAndActive(Long companyId, Integer active);
}
