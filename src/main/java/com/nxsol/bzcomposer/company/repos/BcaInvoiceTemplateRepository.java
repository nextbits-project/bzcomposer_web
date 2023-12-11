package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaInvoiceTemplate;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaInvoiceTemplateRepository extends JpaRepository<BcaInvoiceTemplate, Integer> {
	// @Query("SELECT t FROM BcaInvoiceTemplate t LEFT JOIN t.activeTemplates a
	// WHERE t.templateStyleTypeId = 6 AND t.templateTypeId = 9 AND (t.companyId =
	// :companyId OR t.companyId = -1) ORDER BY t.templateName")

	//@Query("SELECT t FROM BcaInvoiceTemplate t LEFT JOIN t.templateBcaInvoiceActivetemplatess a WHERE t.templateStyleTypeId = 6 AND t.templateTypeId = 9 AND (t.companyId = :companyId OR t.companyId = -1) ORDER BY t.templateName")
	
    @Query("SELECT t FROM BcaInvoiceTemplate t LEFT JOIN t.templateBcaInvoiceActivetemplatess a WHERE t.templateStyleTypeId = 6 AND t.templateTypeId = 9 AND (t.company.companyId = :companyId OR t.company.id = -1) ORDER BY t.templateName")
	List<BcaInvoiceTemplate> findCustomTemplates(@Param("companyId") Long companyId);

}
