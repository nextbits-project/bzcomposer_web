package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaJobcategory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaJobcategoryRepository extends JpaRepository<BcaJobcategory, Integer> {
    List<BcaJobcategory> findByCompany_CompanyIdAndActiveAndIsRecurringServiceJob(Long companyId, Integer active, Integer isRecurringServiceJob);

}
