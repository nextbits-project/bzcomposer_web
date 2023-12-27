package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaBusinesstype;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaBusinesstypeRepository extends JpaRepository<BcaBusinesstype, Integer> {
	List<BcaBusinesstype> findByActiveOrderByBusinessNameAsc(Integer active);
}
