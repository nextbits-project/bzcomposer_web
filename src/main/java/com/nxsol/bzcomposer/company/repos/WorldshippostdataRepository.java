package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.Worldshippostdata;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorldshippostdataRepository extends JpaRepository<Worldshippostdata, String> {
}
