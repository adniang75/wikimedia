package com.alassaneniang.kafkaconsumerwikimedia.repository;

import com.alassaneniang.kafkaconsumerwikimedia.entity.WikimediaData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WikimediaDataRepository extends JpaRepository<WikimediaData, Long> {

}
