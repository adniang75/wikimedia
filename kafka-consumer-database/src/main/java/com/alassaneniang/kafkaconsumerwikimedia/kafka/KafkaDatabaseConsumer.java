package com.alassaneniang.kafkaconsumerwikimedia.kafka;

import com.alassaneniang.kafkaconsumerwikimedia.entity.WikimediaData;
import com.alassaneniang.kafkaconsumerwikimedia.repository.WikimediaDataRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class KafkaDatabaseConsumer {

    private final WikimediaDataRepository dataRepository;

    @KafkaListener(topics = "wikimedia_recentchange", groupId = "myGroup")
    public void consume(String eventMessage) {
        log.info("Event message received -> {}", eventMessage);
        WikimediaData wikimediaData = new WikimediaData();
        wikimediaData.setWikiEventData(eventMessage);
        dataRepository.save(wikimediaData);
    }

}
