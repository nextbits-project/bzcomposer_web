package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.State;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StateRepository extends JpaRepository<State, Integer> {
}
