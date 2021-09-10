package vn.edu.topedu;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@Configuration
public class FireBaseConfig {
	@Autowired
	ResourceLoader resourceLoader;

	@Bean
	FirebaseApp createFireBaseApp() throws IOException {
		
		Resource resource = resourceLoader.getResource("classpath:my-app-2cf3a-firebase-adminsdk-yvol5-d82e6b53b6.json");    
		InputStream serviceAccount = resource.getInputStream();
		
//		FileInputStream serviceAccount = new FileInputStream(
//				"src/main/resources/my-app-2cf3a-firebase-adminsdk-yvol5-d82e6b53b6.json");

		FirebaseOptions options = FirebaseOptions.builder()
			    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
			    //.setDatabaseUrl("https://<DATABASE_NAME>.firebaseio.com/")
			    .build();
		 if(FirebaseApp.getApps().isEmpty()) { //<------- Here
	            FirebaseApp.initializeApp(options);
	        }
		    return FirebaseApp.getInstance();
	}

}