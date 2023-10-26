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
import com.nxsol.bzcomposer.company.domain.ItemDetails;

@Repository
public interface ItemDetailsRepository extends JpaRepository<ItemDetails, Long> {
	@Query("SELECT i, c.categoryName " + "FROM ItemDetails i "
			+ "INNER JOIN ItemCategoryDetails c ON i.category = c.categoryId " + "WHERE i.deleted = 0 "
			+ "AND c.deleted = 0 " + "AND c.company = :compId")
	List<Object[]> findItemsWithCategoryNameByCompany(@Param("compId") BcaCompany company);

	@Query("SELECT i,c.categoryName FROM ItemDetails  i INNER JOIN ItemCategoryDetails  c ON i.category=c.categoryId where i.id=:catID")
	Object findItemDetails(@Param("catID") long catID);

	@Modifying
	@Transactional
	@Query("UPDATE ItemDetails i SET i.deleted=1 WHERE i.id IN :id")
	int deleteItemDetails(@Param("id") List<Long>  id);

	@Modifying
	@Transactional
	@Query("UPDATE ItemDetails i set i.category= :category , i.active= :active , i.description= :description , i.name= :name where i.id = :id")
	int updateItemDetails(@Param("category") ItemCategoryDetails category, @Param("active") boolean active,
			@Param("description") String description, @Param("name") String name, @Param("id") long id);

	ItemDetails findById(long id);

	@Modifying
	@Transactional
	@Query("UPDATE ItemDetails i SET i.category.id = :categoryId, i.active = :active WHERE i.id IN :itemIds")
	void updateCategoryAndActive(@Param("categoryId") Long categoryId, @Param("active") boolean active,
			@Param("itemIds") String itemIds);

}
