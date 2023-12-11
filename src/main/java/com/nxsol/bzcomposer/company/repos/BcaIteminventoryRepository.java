package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaIteminventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaIteminventoryRepository extends JpaRepository<BcaIteminventory, Integer> {
    int countByCompany_CompanyIdAndActiveAndItemTypeIdNot(Long companyId, Integer active, Integer itemTypeId);

}
