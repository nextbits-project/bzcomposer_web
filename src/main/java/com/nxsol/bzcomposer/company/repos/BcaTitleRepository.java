package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaTitle;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaTitleRepository extends JpaRepository<BcaTitle, Integer> {
	
//	List<BcaTitle> findByCompanyId(Integer companyID);
}
