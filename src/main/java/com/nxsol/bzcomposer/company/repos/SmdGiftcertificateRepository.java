package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmdGiftcertificate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmdGiftcertificateRepository extends JpaRepository<SmdGiftcertificate, String> {
}
