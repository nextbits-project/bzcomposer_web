package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.StorageClientvendor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StorageClientvendorRepository extends JpaRepository<StorageClientvendor, String> {
}
