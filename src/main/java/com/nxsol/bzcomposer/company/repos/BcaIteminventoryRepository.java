package com.nxsol.bzcomposer.company.repos;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaIteminventory;

@Repository
public interface BcaIteminventoryRepository extends JpaRepository<BcaIteminventory, Integer> {

	
	
	
	List<BcaIteminventory> findByCompany_CompanyIdAndActive(Long companyId, Integer active );

	
	@Query(value=" select new com.pritesh.bizcomposer.accounting.bean.BcaIteminventoryDto (a.inventoryId , a.parentId , a.isCategory , a.inventoryCode , a.inventoryName , a.salePrice , a.purchasePrice , a.dealerPrice , a.qty , a.weight ,"
			+ " a.taxable , a.serialNum , a.itemTypeId,date_format(a.dateAdded,'%m-%d-%Y') as dateAdded , l.name  as location ,"
			+ " date_format(a.dateReceived,'%m-%d-%Y') as dateRecieved , a.memo , a.expectedQty , a.inventoryCode as category , a.reorderPoint) "
			+ "	from BcaIteminventory as a inner join BcaIteminventory as b on a.parentId = b.inventoryId left join BcaLocation as l on "
			+ "	l.locationId = a.location where a.company.companyId = :companyId and a.parentId <> 0 and a.active = :active and "
			+ " a.itemTypeId <> 0 order by a.parentId ")
	List<?> findItemList(@Param("companyId") Long companyId ,@Param("active") Integer active);
	
	List<BcaIteminventory> findByParentIdAndItemTypeIdAndActive(Integer parentId, Integer itemTypeId, Integer active);

	List<BcaIteminventory> findByParentIdAndActive(Integer parentId,  Integer active);
	
	@Modifying
	@Transactional
	@Query("update BcaIteminventory bi set bi.salePrice = :salePrice where bi.inventoryId = :inventoryId and bi.company.companyId = :companyId ")
	int  updateSalesPriceByInventoryIdAndCompanyId(@Param("salePrice")Double salePrice ,@Param("inventoryId")Integer inventory,@Param("companyId") Long companyId);
	
	@Modifying
	@Transactional
	@Query("update BcaIteminventory bi set bi.inventoryName = :inventoryName where bi.inventoryId = :inventoryId and bi.company.companyId = :companyId ")
	int  updateInventoryNameByInventoryIdAndCompanyId(@Param("inventoryName")String inventoryName ,@Param("inventoryId")Integer inventory,@Param("companyId") Long companyId);
	
	@Query("select bi from BcaIteminventory bi where bi.company.companyId = :companyId and bi.active = :active and bi.itemTypeId <> :itemTypeId ")
	List<BcaIteminventory> findByCompanyIdAndActiveAndItemTypeIdNot(@Param("companyId")Long companyId ,@Param("active") Integer active,@Param("itemTypeId")Integer itemTypeId);
	
	@Query("select bi from BcaIteminventory  bi where bi.company.companyId = :companyId and bi.active = :active and biitemTypeId <> :itemTypeId  and bi.inventoryId = :inventoryId")
	List<BcaIteminventory>  findByCompanyIdAndActiveAndItemTypeNotAndInventoryId(@Param("companyId")Long companyId ,@Param("active") Integer active,@Param("itemTypeId")Integer itemTypeId,@Param("inventoryId") Integer inventoryId);
	

    int countByCompany_CompanyIdAndActiveAndItemTypeIdNot(Long companyId, Integer active, Integer itemTypeId);
    

    
    Optional<BcaIteminventory> findByInventoryIdAndInventoryBcaCarts_CartId(Integer inventoryId, Integer cartId);
    Optional<BcaIteminventory> findByInventoryBcaCarts_CartId(Integer cartId);
    
    @Modifying
    @Query("UPDATE BcaIteminventory i SET i.dateReceived = CURRENT_TIMESTAMP WHERE i.inventoryId IN (SELECT c.inventory.inventoryId FROM BcaCart c WHERE c.cartId = ?1 AND c.inventory.inventoryId = i.inventoryId)")
    int updateDateReceivedByCartIdAndInventoryId(Integer cartId);
    
    String sqlString = "select InventoryID,InventoryCode,InventoryDescription,Qty,Weight,SalePrice,isCategory,ItemTypeID,InventoryName,SerialNum"
			+ " from bca_iteminventory where CompanyID=? and Active=1 and ParentID < 1 ";
    
    List<BcaIteminventory> findByCompany_CompanyIdAndActiveAndParentIdLessThan(long companyId,int active,int parentId);

    List<BcaIteminventory> findByItemTypeIdAndActiveAndParentId(int itemTypeId,int active,int parentId);


}
