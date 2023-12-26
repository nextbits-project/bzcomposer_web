package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpJobtitle;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpJobtitleRepository extends JpaRepository<BcpJobtitle, Integer> {
	List<BcpJobtitle> findByCompany_CompanyIdAndActive(Long companyId, Integer active);

}
