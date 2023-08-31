package com.nxsol.bizcomposer.modal.repositories;

import com.nxsol.bizcomposer.modal.entities.SmcOrders;
import org.springframework.data.jpa.repository.JpaRepository;


public interface SmcOrdersRepository extends JpaRepository<SmcOrders, String> {
}
