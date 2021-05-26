package vn.edu.topedu.socket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")
        .setAllowedOrigins("*")
        .withSockJS();
        
        registry.addEndpoint("/notifications")
		.setAllowedOrigins("*")
		//.set
		.withSockJS();
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app","/swns");
        registry.enableSimpleBroker("/topic","/notification");   // Enables a simple in-memory broker
        
        

       
    }
}
