package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BizcalAppoint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BizcalAppointRepository extends JpaRepository<BizcalAppoint, Integer> {
}
