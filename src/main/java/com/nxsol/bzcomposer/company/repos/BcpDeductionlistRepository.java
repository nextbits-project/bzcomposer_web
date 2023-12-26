package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpDeductionlist;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpDeductionlistRepository extends JpaRepository<BcpDeductionlist, Integer> {
	Optional<BcpDeductionlist> findByCompany_CompanyIdAndDeductionListId(Long companyId, Long deductionListId);

	List<BcpDeductionlist> findByActiveAndCompany_CompanyId(Integer active, Long companyId);

}
