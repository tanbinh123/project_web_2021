package vn.edu.topedu.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import vn.edu.topedu.entity.ActiveAccount;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.fileprocess.FileProcess;

@Repository
@Transactional
public class ResourceImageDAO {

	@Autowired
	private EntityManager entityManager;

	public ResourceImage findById(Long id) {
		return this.entityManager.find(ResourceImage.class, id);
	}

	public List<ResourceImage> getResourceImages(Long userId) {
		String sql = "Select e from " + ResourceImage.class.getName() + " e "
				+ " where e.deleted=false and e.appUser.id =:userId ";
		Query query = this.entityManager.createQuery(sql, ResourceImage.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}

	public List<ResourceImage> getResourceImages(int _limit, int _page) {
		_page--;
		String sql = "Select e from " + ResourceImage.class.getName() + " e " + " where e.deleted=false ";
		Query query = this.entityManager.createQuery(sql, ResourceImage.class);
		query.setFirstResult(_page * _limit);
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}

		return query.getResultList();
	}

	public long getCountResourceImages() {
		String sql = "Select count(e.id) from " + ResourceImage.class.getName() + " e " + " where e.deleted=false ";
		Query query = this.entityManager.createQuery(sql, Long.class);
		return (long) query.getSingleResult();
	}

	public List<ResourceImage> getResourceImages(String userName) {
		String sql = "Select e from " + ResourceImage.class.getName() + " e "
				+ " where e.deleted=false and e.appUser.userName =:userName ";
		Query query = this.entityManager.createQuery(sql, ResourceImage.class);
		query.setParameter("userName", userName);
		return query.getResultList();
	}

	public List<ResourceImage> getResourceImages() {
		String sql = "Select e from " + ResourceImage.class.getName() + " e " + " where e.deleted=false  ";
		Query query = this.entityManager.createQuery(sql, ResourceImage.class);
		return query.getResultList();
	}

	public ResourceImage save(ResourceImage image) {
		if (image.getId() != null) {
			return entityManager.merge(image);
		} else {
			entityManager.persist(image);
			entityManager.flush();
			return image;
		}
	}

	public ResourceImage deleteImage(long id) {
		ResourceImage deleted = findById(id);
		deleted.setDeleted(true);
		entityManager.merge(deleted);
		entityManager.flush();
		return deleted;

	}

	public List<ResourceImage> getResourceImagesNoLinked() {
		String sql = "Select e from " + ResourceImage.class.getName() + " e "
				+ " where e.countLinked=0  and deleted=true ";
		Query query = this.entityManager.createQuery(sql, ResourceImage.class);
		return query.getResultList();
	}

	@Transactional
	public int deleteAllNoLink() throws Exception {
		try {

			List<ResourceImage> a = getResourceImagesNoLinked();
			for (ResourceImage ri : a) {
				Path path = FileProcess.getPath(ri.getPath());
				path.toFile().delete();
			}
			String sql = "delete from " + ResourceImage.class.getName() + " where countLinked=0 and deleted=true ";
			Query query = this.entityManager.createQuery(sql);

			return query.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
	@Transactional
	public ResourceImage uploadImage(MultipartFile uploadAvatar, AppUser appUser) throws Exception {
		ResourceImage newAvatar = null;
		if(uploadAvatar!=null) {
			System.err.println("Avatar upload");
			
			String pathContain = null;
			try {
				ResourceImage image = new ResourceImage();
				pathContain = String.format("user/%s/image", appUser.getUsername());
				image.setPath(pathContain + "/" + uploadAvatar.getOriginalFilename());
				image.setAppUser(appUser);
				newAvatar=save(image);
				
				pathContain = String.format("user/%s/image", appUser.getUsername());
				
				String filename= uploadAvatar.getOriginalFilename();
				Matcher m = Pattern.compile("^(.+)(|_\\d*)\\.(\\w+)$").matcher(filename);
				if(m.find()) {
					String name=m.group(1)+"_"+newAvatar.getId();
					String extend=m.group(3);
					
					System.err.println(String.format("Name: %s", name));
					System.err.println(String.format("Extend: %s", extend));
					filename=name+"."+extend;
					
				}
				System.out.println(String.format("File: %s", uploadAvatar.getOriginalFilename()));
				File p = FileProcess.getPath(pathContain, filename).toFile();
				System.out.println(p.getAbsolutePath());
				p.getParentFile().mkdirs();
				InputStream initialStream = uploadAvatar.getInputStream();
				OutputStream outStream = new FileOutputStream(p);
				byte[] buffer = new byte[8 * 1024];
				int bytesRead;
				while ((bytesRead = initialStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
				IOUtils.closeQuietly(initialStream);
				IOUtils.closeQuietly(outStream);

				
				System.err.println("Upload Success");
			} catch (Exception e) {
				System.err.println(e.getMessage());
				throw e;
			}
		}
		return newAvatar;
	}

}
