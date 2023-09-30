package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BizcalReminder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BizcalReminderRepository extends JpaRepository<BizcalReminder, Integer> {
}
