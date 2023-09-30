package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmdStoreebaycategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmdStoreebaycategoryRepository extends JpaRepository<SmdStoreebaycategory, Integer> {
}
