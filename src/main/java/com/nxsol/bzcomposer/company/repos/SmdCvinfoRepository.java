package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmdCvinfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmdCvinfoRepository extends JpaRepository<SmdCvinfo, String> {
}
