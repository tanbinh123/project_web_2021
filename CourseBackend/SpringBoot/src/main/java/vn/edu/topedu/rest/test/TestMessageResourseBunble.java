package vn.edu.topedu.rest.test;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestMessageResourseBunble {
	@Autowired
	private MessageSource messageSource;

	@RequestMapping(value = "/test/messageSource"
			,method = RequestMethod.GET
			)
	@ResponseBody
	public ResponseEntity<Object> testMessageSource() {
		String enM = messageSource.getMessage("l2", new Object[] {"Nanashi"}, Locale.ENGLISH);
		String viM = messageSource.getMessage("l2", new Object[] {"Nanashi"}, new Locale("vi", "VN"));
		String viM2 = messageSource.getMessage("l1", null, new Locale("vi", "VN"));
		System.out.println(viM2);
		String deM = messageSource.getMessage("l2", new Object[] {"Nanashi"}, Locale.GERMAN);
		return ResponseEntity.ok(new Object() {
			String en =enM;
			public String getEn() {
				return en;
			}
			String vi =viM;
			public String getVi() {
				return vi;
			}
			String de =deM;
			public String getDe() {
				return de;
			}
			
		});
	}
	

}
