package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLabel;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLabelRepository extends JpaRepository<BcaLabel, Integer> {
	List<BcaLabel> findAllByOrderByLabelType();
	
	
List<BcaLabel> findByIdGreaterThanOrderByIdAsc(Integer id);
	
}
