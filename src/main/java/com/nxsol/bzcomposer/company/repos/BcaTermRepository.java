package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaTerm;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaTermRepository extends JpaRepository<BcaTerm, Integer> {

	List<BcaTerm> findByCompany_CompanyIdAndActive(Long companyId, Integer active);

	Optional<BcaTerm> findByTermIdAndCompany_CompanyId(int id, Long companyId);

}
