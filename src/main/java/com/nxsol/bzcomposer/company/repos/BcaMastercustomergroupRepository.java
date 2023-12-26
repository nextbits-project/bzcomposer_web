package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaMastercustomergroup;

@Repository
public interface BcaMastercustomergroupRepository extends JpaRepository<BcaMastercustomergroup, Integer> {

	
	
	List<BcaMastercustomergroup> findByCustomerGroupIdNotAndActiveOrderByCustomerGroupId(Integer customerGroupId, Integer active);


}
