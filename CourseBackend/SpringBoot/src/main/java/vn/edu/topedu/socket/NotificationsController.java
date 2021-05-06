package vn.edu.topedu.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageType;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NotificationsController {

	private final NotificationDispatcher dispatcher;
	 
	@Autowired
	public NotificationsController(NotificationDispatcher dispatcher) {
		this.dispatcher = dispatcher;
	}

	@MessageMapping("/start")
	public void start(StompHeaderAccessor stompHeaderAccessor) {
		System.out.println("start:" + stompHeaderAccessor.getSessionId());
		dispatcher.add(stompHeaderAccessor.getSessionId());
	}

	@MessageMapping("/stop")
	public void stop(StompHeaderAccessor stompHeaderAccessor) {
		System.out.println("remove");
		dispatcher.remove(stompHeaderAccessor.getSessionId());
	}

	@GetMapping("/test")
	public ResponseEntity<Object> test(String id) {
		System.out.println(id);
		this.dispatcher.send(id,  "Hello");
		
		return ResponseEntity.ok(new Object() {
			public String mess = id;
		});

	}
}
