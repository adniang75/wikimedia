package com.alassaneniang.kafkaconsumerwikimedia.kafka;

import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class KafkaDatabaseConsumer {

    @KafkaListener(topics = "wikimedia_recentchange", groupId = "myGroup")
    public void consume(String eventMessage) {
        log.info("Event message received -> {}", eventMessage);
    }

}
