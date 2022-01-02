package com.kh.cosmos.common.aop;

import java.util.List;

import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.messaging.converter.MessageConverter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.cosmos.HtmlEscapingObjectMapperFactory.HTMLCharacterEscapes;

public class WebSocketXssFilter {

	public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
    	messageConverters.add(escapingConverter());
        return true;
    }

    private MessageConverter escapingConverter() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());

        MappingJackson2MessageConverter escapingConverter =
                new MappingJackson2MessageConverter();
        escapingConverter.setObjectMapper(objectMapper);

        return escapingConverter;
    }
}
