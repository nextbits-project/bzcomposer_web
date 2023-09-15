package com.nxsol.bzcomposer.company.repos;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface BaseRepository<T, D extends Serializable> extends JpaRepository<T, D>, JpaSpecificationExecutor<T> {
	
}