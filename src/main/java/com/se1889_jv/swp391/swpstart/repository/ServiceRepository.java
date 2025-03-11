package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long> {

    boolean existsByName(String name);

    @Query("SELECT CASE WHEN COUNT(s) > 0 THEN true ELSE false END " +
            "FROM Service s " +
            "WHERE s.name = :newName " +
            "AND s.name != :oldName")
    boolean existsByNameExcludingOldName(@Param("newName") String newName,
                                         @Param("oldName") String oldName);

    List<Service> findAllByActive(boolean active);
}
