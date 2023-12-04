package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaFeatures;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaFeaturesRepository extends JpaRepository<BcaFeatures, String> {
	List<BcaFeatures> findByBusinessId(Integer businessID);
}
