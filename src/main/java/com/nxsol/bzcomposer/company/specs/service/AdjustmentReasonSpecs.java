package com.nxsol.bzcomposer.company.specs.service;

import java.util.Collections;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.nxsol.bzcomposer.company.domain.AdjustmentReason;
import com.nxsol.bzcomposer.company.repos.AdjustmentReasonRepository;
import com.nxsol.bzcomposer.company.specs.pagination.PageRequestBuilder;
import com.nxsol.bzcomposer.company.specs.pagination.SearchFilters;
import com.nxsol.bzcomposer.company.specs.pagination.filter.FilterBuilder;
import com.nxsol.bzcomposer.company.specs.pagination.filter.FilterSpecifications;
import com.nxsol.bzcomposer.company.specs.response.PageResponse;


@Service
public class AdjustmentReasonSpecs {

    private final AdjustmentReasonRepository adjustmentReasonRepository;

    public AdjustmentReasonSpecs(AdjustmentReasonRepository employeeRepository) {
        this.adjustmentReasonRepository = employeeRepository;
    }

//    @Override
    public Page<AdjustmentReason> findAllSpecification(Specification<AdjustmentReason> specs, Pageable pageable) {
        return adjustmentReasonRepository.findAll(specs, pageable);
    }

    public Page<AdjustmentReason> findAllPaginate(Pageable pageable) {
        return adjustmentReasonRepository.findAll(pageable);
    }
    
    public PageResponse<AdjustmentReason> getResponse(int page, int size, String filterOr, String filterAnd) {
		FilterSpecifications<AdjustmentReason> specifications = new FilterSpecifications<>();
          Page<AdjustmentReason> pg;
          PageResponse<AdjustmentReason> resp = new PageResponse<>();
          Pageable pageable = PageRequestBuilder.getPageable(size, page, Collections.emptyList(), Sort.Direction.ASC);


        SearchFilters searchFilters = new SearchFilters(FilterBuilder.getFilters(filterAnd),FilterBuilder.getFilters(filterOr));
        specifications.addCondition(searchFilters);


        pg = findAllSpecification(specifications, pageable);
        resp.setPageStats(pg, pg.getContent());
		return resp;
	}

}
