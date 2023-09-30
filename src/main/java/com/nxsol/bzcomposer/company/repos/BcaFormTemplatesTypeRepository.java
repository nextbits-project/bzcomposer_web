package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaFormTemplatesType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaFormTemplatesTypeRepository extends JpaRepository<BcaFormTemplatesType, Integer> {
}
