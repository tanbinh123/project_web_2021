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
import vn.edu.topedu.model.Video;

@Repository
@Transactional
public class VideoDAO {

	@Autowired
	private EntityManager entityManager;

	public VideoEntity findById(Long id) {
		return this.entityManager.find(VideoEntity.class, id);
	}

	public List<VideoEntity> getResourceImages(Long userId) {
		String sql = "Select e from " + VideoEntity.class.getName() + " e "
				+ " where e.deleted=false and e.appUser.id =:userId ";
		Query query = this.entityManager.createQuery(sql, VideoEntity.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}

	public List<VideoEntity> getVideoEntitys(int _limit, int _page) {
		_page--;
		String sql = "Select e from " + VideoEntity.class.getName() + " e " + " where e.deleted=false ";
		Query query = this.entityManager.createQuery(sql, VideoEntity.class);
		query.setFirstResult(_page * _limit);
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}

		return query.getResultList();
	}

	public long getCountResourceImages() {
		String sql = "Select count(e.id) from " + VideoEntity.class.getName() + " e " + " where e.deleted=false ";
		Query query = this.entityManager.createQuery(sql, Long.class);
		return (long) query.getSingleResult();
	}

	public List<VideoEntity> getResourceImages(String userName) {
		String sql = "Select e from " + VideoEntity.class.getName() + " e "
				+ " where e.deleted=false and e.appUser.userName =:userName ";
		Query query = this.entityManager.createQuery(sql, VideoEntity.class);
		query.setParameter("userName", userName);
		return query.getResultList();
	}

	public VideoEntity save(VideoEntity image) {
		if (image.getId() != null) {
			return entityManager.merge(image);
		} else {
			entityManager.persist(image);
			entityManager.flush();
			return image;
		}
	}

	public VideoEntity deleteImage(long id) {
		VideoEntity deleted = findById(id);
		deleted.setDeleted(true);
		entityManager.merge(deleted);
		entityManager.flush();
		return deleted;

	}
	public List<VideoEntity> getResourceImagesNoLinked() {
		String sql = "Select e from "+VideoEntity.class.getName()+" e " + " where e.countLinked=0  and deleted=true ";
		Query query = this.entityManager.createQuery(sql, VideoEntity.class);
		return query.getResultList();
	}
	@Transactional
	public int deleteAllNoLink() throws Exception {
		try {
			List<VideoEntity> a = getResourceImagesNoLinked();
			for(VideoEntity ri:a) {
				Path path = FileProcess.getPath(ri.absPath());
				if(path.toFile().delete()) {
					System.err.println(String.format("Delete file: %s", path.toString()));
				};
			}
			
			String sql = "delete from " + VideoEntity.class.getName() +  " where countLinked=0 and deleted=true ";
			Query query = this.entityManager.createQuery(sql);
			return  query.executeUpdate();
			
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
	
	@Transactional
	public VideoEntity uploadVideo(MultipartFile uploadVideo, AppUser appUser) throws Exception {
		VideoEntity newFile = null;
		if(uploadVideo!=null) {
			System.err.println("Video upload");
			
			String pathContain = null;
			try {
				VideoEntity image = new VideoEntity();
				pathContain = String.format("user/%s/video", appUser.getUsername());
				image.setVideo(pathContain + "/" + uploadVideo.getOriginalFilename());
				image.setAppUser(appUser);
				newFile=save(image);
				
				pathContain = String.format("user/%s/video", appUser.getUsername());
				
				String filename= 
				newFile.absPath();
				System.out.println(String.format("File: %s", uploadVideo.getOriginalFilename()));
				File p = FileProcess.getPath(filename).toFile();
				System.out.println(p.getAbsolutePath());
				p.getParentFile().mkdirs();
				InputStream initialStream = uploadVideo.getInputStream();
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
		return newFile;
	}

}
