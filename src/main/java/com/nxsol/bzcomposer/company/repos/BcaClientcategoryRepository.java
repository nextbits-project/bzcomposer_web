package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaClientcategory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaClientcategoryRepository extends JpaRepository<BcaClientcategory, Integer> {
	List<BcaClientcategory> findByCompany_CompanyIdAndActive(Long companyId, Integer active);

	@Query("Select name FROM BcaClientcategory Where cvcategoryId =:cvCategoryId")
	String findNameByCvcategoryId(int cvCategoryId);

}
