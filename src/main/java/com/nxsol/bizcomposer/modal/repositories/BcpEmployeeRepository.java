package com.nxsol.bizcomposer.modal.repositories;

import com.nxsol.bizcomposer.modal.entities.BcpEmployee;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcpEmployeeRepository extends JpaRepository<BcpEmployee, Integer> {
}
