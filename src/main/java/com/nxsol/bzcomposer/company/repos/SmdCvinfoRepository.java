package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.SmdCvinfo;

@Repository
public interface SmdCvinfoRepository extends JpaRepository<SmdCvinfo, String> {

	List<SmdCvinfo> findByClientVendor_ClientVendorId(int clientVendorId);
}
