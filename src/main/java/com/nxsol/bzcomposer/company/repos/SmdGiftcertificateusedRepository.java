package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmdGiftcertificateused;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmdGiftcertificateusedRepository extends JpaRepository<SmdGiftcertificateused, String> {
}
