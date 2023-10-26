package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.transaction.annotation.Transactional;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.ItemCategoryDetails;

@Repository
public interface ItemCategoryDetailsRepository extends JpaRepository<ItemCategoryDetails, Long> {

	ItemCategoryDetails findByCategoryId(long categoryId);

	List<ItemCategoryDetails> findByDeletedAndParentIdAndCompany(Boolean deleted, String parentId, BcaCompany Company);

	@Query("SELECT icd " + "FROM ItemCategoryDetails icd " + "WHERE icd.deleted = 0 " + "AND icd.parentId <> 'root' "
			+ "AND icd.company = :compId")
	List<ItemCategoryDetails> findSubCategoryList(@Param("compId") BcaCompany Company);

	ItemCategoryDetails findByDeletedAndCategoryId(Boolean deleted, Long categoryId);

	@Modifying
	@Transactional
	@Query("UPDATE ItemCategoryDetails icd SET icd.deleted = 1 WHERE icd.categoryId = :catID")
	int deleteCategoryDetails(Long catID);

	@Modifying
	@Transactional
	@Query("UPDATE ItemCategoryDetails icd " + "SET icd.parentId = :parentId, " + "icd.categoryName = :categoryName, "
			+ "icd.description = :description, " + "icd.active = :active " + "WHERE icd.categoryId = :categoryId")
	int updateCategoryDetails(@Param("parentId") String parentId, @Param("categoryName") String categoryName,
			@Param("description") String description, @Param("active") boolean active,
			@Param("categoryId") Long categoryId);

}
