package vn.edu.topedu.request;

import org.springframework.web.multipart.MultipartFile;

public class UploadFileRequest {
	private String name;
	private MultipartFile file;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	/**
	 * 
	 */
	public UploadFileRequest() {
		super();
	}
	public UploadFileRequest(String name, MultipartFile file) {
		super();
		this.name = name;
		this.file = file;
	}
	
	

}
