package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaStore;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaStoreRepository extends JpaRepository<BcaStore, Integer> {
	List<BcaStore> findByCompany_CompanyIdAndActiveAndDeleted(Long companyId, int active, int deleted);

	List<BcaStore> findByCompany_CompanyIdAndStoreType_StoreTypeIdInAndActiveAndDeleted(Long companyId,
			List<Integer> storeTypeIds, int active, int deleted);

	List<BcaStore> findByCompany_CompanyIdAndDeletedAndStoreType_StoreTypeId(Long companyId, Integer deleted,
			Integer storeTypeId);

	List<BcaStore> findByCompany_CompanyIdAndDeleted(Long companyId, Integer deleted);
}
