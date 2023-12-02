package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMailtemplate;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMailtemplateRepository extends JpaRepository<BcaMailtemplate, Integer> {

	List<BcaMailtemplate> findByActive(Integer isActive);

	BcaMailtemplate findByTemplateIdAndActive(int templateId, Integer isActive);
}
