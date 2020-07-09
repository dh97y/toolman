package com.hzy.toolman.system.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

/**
 * @projectName: toolman
 * @description:
 * @author: hzy
 * @create: 2020-07-07 17:56
 **/
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) { // endPoint 注册协议节点，并映射指定的URI

        // 注册一个名字为"endpointChat"的endPoint，并指定 Socket协议。  点对点
        registry.addEndpoint("/endpointChat").withSockJS();
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) { // 配置消息代理（message broker)
        // 点对点式增加一个 queue 消息代理
        registry.enableSimpleBroker("/queue", "/topic");
    }
}
