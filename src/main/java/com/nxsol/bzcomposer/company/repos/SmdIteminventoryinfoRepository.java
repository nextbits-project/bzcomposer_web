package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmdIteminventoryinfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmdIteminventoryinfoRepository extends JpaRepository<SmdIteminventoryinfo, String> {
}
