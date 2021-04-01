package vn.edu.topedu.email;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

@Component
public class EmailService {
	@Value("${spring.mail.username}")
	private String fromEmailAddress;
	@Autowired
	private JavaMailSender emailSender;

	@Autowired
	private SpringTemplateEngine templateEngine;

	public void sendSimpleMessage(String to, String subject, String text, boolean isBackground) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(fromEmailAddress);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		if (!isBackground) {
			emailSender.send(message);
			return;
		} else {
			new Thread(new Runnable() {
				@Override
				public void run() {
					emailSender.send(message);

				}
			}).start();
		}

	}

	public void sendSimpleMessageMultiRecipients(String[] to, String subject, String text, boolean isBackground) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(fromEmailAddress);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		if (!isBackground) {
			emailSender.send(message);
			return;
		} else {
			new Thread(new Runnable() {
				@Override
				public void run() {
					emailSender.send(message);
				}
			}).start();
		}

	}

	public void sendMessageWithAttachment(String to, String subject, String text, String[] pathToAttachment,
			boolean isHtml, boolean isBackground) throws MessagingException {
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		helper.setFrom(fromEmailAddress);
		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(text, isHtml);
		// FileProcess.get
		if(pathToAttachment!=null) {
			for(String str:pathToAttachment) {
				FileSystemResource file = new FileSystemResource(new File(str));
				helper.addAttachment("Invoice", file);			
			}
		}
		if (!isBackground) {
			emailSender.send(message);
			return;
		} else {
			new Thread(new Runnable() {
				@Override
				public void run() {
					emailSender.send(message);
				}
			}).start();
		}
	}

	public void sendMessageWithAttachmentMultiRecipients(String[] to, String subject, String text,
			String[] pathToAttachment, boolean isHtml, boolean isBackground) throws MessagingException {
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		helper.setFrom(fromEmailAddress);
		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(text, isHtml);
		// FileProcess.get
		if(pathToAttachment!=null) {
			for(String str:pathToAttachment) {
				FileSystemResource file = new FileSystemResource(new File(str));
				helper.addAttachment("Invoice", file);			
			}
		}
		if (!isBackground) {
			emailSender.send(message);
			return;
		} else {
			new Thread(new Runnable() {
				@Override
				public void run() {
					emailSender.send(message);
				}
			}).start();
		}

	}

	public void sendMessageWithAttachment(String to, String subject, String[] pathToAttachment, boolean isBackground)
			throws MessagingException {
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		helper.setFrom(fromEmailAddress);
		helper.setTo(to);
		helper.setSubject(subject);
		Context context = new Context();
		Map<String, Object> props = new HashMap<>();
		props.put("name", "Developer!");
		props.put("location", "United States");
		props.put("sign", "Java Developer");
		context.setVariables(props);
		String html = templateEngine.process("newsletter-template", context);
		helper.setText(html, true);
		if(pathToAttachment!=null) {
			for(String str:pathToAttachment) {
				FileSystemResource file = new FileSystemResource(new File(str));
				helper.addAttachment("Invoice", file);			
			}
		}
		if (!isBackground) {
			emailSender.send(message);
			return;
		} else {
			new Thread(new Runnable() {
				@Override
				public void run() {
					emailSender.send(message);
				}
			}).start();
		}
	}
}
