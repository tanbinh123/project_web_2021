package vn.edu.topedu.entity;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.consts.VariableConst;

@Entity
@Table(name = "Resource_Image")
public class ResourceImage extends AHasResource {
	
	@Column(name = "img_path", length = 36, nullable = false)
	private String path = "";
	public ResourceImage() {
		super();
	}	

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	



	

	@Override
	public void setBeforeResource(String beforeResource) {
		if(checkExtendResource())super.setBeforeResource("");else super.setBeforeResource(beforeResource);
	}

	public boolean checkExtendResource() {
		if (this.path != null
				&& (this.path.contains("http") || this.path.contains("data:image"))) {
			return true;
		}
		return false;
	}
	public String getImage() {
		String filename=this.path;
		Matcher m = Pattern.compile("^(.+)(|_\\d*)\\.(\\w+)$").matcher(filename);
		if(m.find()) {
			String name=m.group(1)+"_"+this.getId();
			String extend=m.group(3);
			
//			System.err.println(String.format("Name: %s", name));
//			System.err.println(String.format("Extend: %s", extend));
			filename=name+"."+extend;
			
		}
		
		return ((this.beforeResource != null && this.beforeResource!="") ? this.beforeResource + VariableConst.RESOURCE_BEFORE : "")  + filename;
	}
	@JsonIgnore
	public String getAbsPath() {
		String filename=this.path;
		Matcher m = Pattern.compile("^(.+)(_\\d*)\\.(\\w+)$").matcher(filename);
		if(m.find()) {
			String name=m.group(1)+"_"+this.getId();
			String extend=m.group(3);
			
//			System.err.println(String.format("Name: %s", name));
//			System.err.println(String.format("Extend: %s", extend));
			filename=name+"."+extend;
			
		}else {
			m = Pattern.compile("^(.+)\\.(\\w+)$").matcher(filename);
			if(m.find()) {
				String name=m.group(1)+"_"+this.getId();
				String extend=m.group(2);
				
//				System.err.println(String.format("Name: %s", name));
//				System.err.println(String.format("Extend: %s", extend));
				filename=name+"."+extend;
				
			}
		}
		return filename;
	}


	
}
