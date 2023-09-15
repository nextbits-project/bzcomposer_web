package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpEmployee;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcpEmployeeRepository extends JpaRepository<BcpEmployee, Integer> {
}
