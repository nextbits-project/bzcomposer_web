package com.nxsol.bzcomposer.company.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcpJobcode;

@Repository
public interface BcpJobcodeRepository extends JpaRepository<BcpJobcode, Integer> {

	List<BcpJobcode> findByCompany_CompanyIdOrderByName(Long companyId);

	Optional<BcpJobcode> findByJobIdAndCompany_CompanyId(int jobId, Long companyId);

}
