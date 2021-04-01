package vn.edu.topedu.request;

import org.springframework.http.codec.multipart.FilePart;

public class UploadFileRequest {
	private String name;
	private FilePart file;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public FilePart getFile() {
		return file;
	}
	public void setFile(FilePart file) {
		this.file = file;
	}
	/**
	 * 
	 */
	public UploadFileRequest() {
		super();
	}
	public UploadFileRequest(String name, FilePart file) {
		super();
		this.name = name;
		this.file = file;
	}
	
	

}
