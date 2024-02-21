package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.domain.BcaCategory;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaCategoryRepository extends JpaRepository<BcaCategory, Integer> {
	@Query("SELECT a,b.categoryTypeName FROM BcaCategory a, BcaCategorytype b "
			+ "where a.categoryTypeId=b.categoryTypeId"
			+ " AND a.isActive=1 AND a.company= :companyId ORDER BY a.cateNumber")
	List<Object[]> findCategory(@Param("companyId") BcaCompany company);

	@Query("SELECT bc FROM BcaCategory bc " + "WHERE bc.categoryTypeId = -450722500 " + "AND bc.parent = 'root' "
			+ "AND bc.company = :companyId " + "AND bc.categoryId NOT IN (2146772369, 2146772370)")
	List<BcaCategory> getByCategoryTypeIdAndParentIdAndCompanyId(@Param("companyId") BcaCompany companyId);

	@Cacheable(value="bcaCategory",key="#companyId")
	List<BcaCategory> findByCompany_CompanyIdAndIsActive(long companyId, boolean isActive);

	List<BcaCategory> findByCategoryTypeIdAndParentAndCompany(Integer categoryTypeId, String parent,
			BcaCompany company);

	List<BcaCategory> findByParentAndIsActive(String parent, Boolean isActive);

	List<BcaCategory> findByCompanyAndCategoryId(BcaCompany company, Integer categoryId);
	@Cacheable(value="categoryListForPayment",key="{#companyId, #categoryTypeId}")
	List<BcaCategory> findByCompany_CompanyIdAndIsActiveAndCategoryTypeIdOrderByNameAsc(long companyId, Boolean isActive,
			Integer categoryTypeId);
	
	List<BcaCategory> findByCompanyAndIsActiveOrderByCategoryTypeIdAscNameAsc(BcaCompany company, boolean isActive);

	List<BcaCategory> findByCompanyAndName(BcaCompany company, String name);
	
    List<BcaCategory> findByCompany_CompanyIdAndIsActiveOrderByCategoryTypeIdAscNameAsc(Long companyId, boolean isActive);

}
