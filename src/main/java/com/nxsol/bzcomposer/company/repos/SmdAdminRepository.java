package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmdAdmin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmdAdminRepository extends JpaRepository<SmdAdmin, String> {
}
