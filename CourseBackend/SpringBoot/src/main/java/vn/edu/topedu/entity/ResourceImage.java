package vn.edu.topedu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
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
		return ((this.beforeResource != null && this.beforeResource!="") ? this.beforeResource + VariableConst.RESOURCE_BEFORE : "")  + this.path;
	}


	
}
