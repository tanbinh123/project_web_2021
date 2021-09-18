package vn.edu.topedu.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
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
import vn.edu.topedu.entity.NotificationEntity;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.BaseCourse;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.fileprocess.FileProcess;
import vn.edu.topedu.model.Video;
import vn.edu.topedu.utils.WebUtils;

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
	public List<VideoEntity> getVideoNoLinked(int deleted) {
		String sql = "Select e from "+VideoEntity.class.getName()+" e " + " where e.countLinked=0   ";
		if(deleted!=-1)sql+=" and e.deleted= :deleted ";
		Query query = this.entityManager.createQuery(sql, VideoEntity.class);
		if(deleted!=-1) query.setParameter("deleted", deleted==1);
		return query.getResultList();
	}
	
	@Transactional
	public int deleteAllNoLink(int deleted) throws Exception {
		try {
			List<VideoEntity> a = getVideoNoLinked(deleted);
			for(VideoEntity ri:a) {
				Path path = FileProcess.getPath(ri.absPath());
				if(path.toFile().delete()) {
					System.err.println(String.format("Delete file: %s", path.toString()));
				};
			}
			
			String sql = "delete from " + VideoEntity.class.getName() +  "  e where e.countLinked=0 ";
			if(deleted!=-1)sql+=" and e.deleted= :deleted ";
			
			Query query = this.entityManager.createQuery(sql);
			if(deleted!=-1) query.setParameter("deleted", deleted==1);
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
				String originImage=uploadVideo.getOriginalFilename();
				originImage=originImage.replaceAll("[^0-9a-zA-Z\\.]", "_");
				image.setVideo(pathContain + "/" + originImage);
				
				image.setAppUser(appUser);
				newFile=save(image);
				
				pathContain = String.format("user/%s/video", appUser.getUsername());
				
				String filename= 
				newFile.absPath();
				System.out.println(String.format("File: %s", filename));
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
	
	public String fullName(String filename) {
		
		Matcher m = Pattern.compile("^(.+)(_\\d*)\\.([0-9a-zA-Z]+)$").matcher(filename);
		if (m.find()) {
			String name = m.group(1) ;//+ "_" + this.getId();
			String extend = m.group(3);

//			System.err.println(String.format("Name: %s", name));
//			System.err.println(String.format("Extend: %s", extend));
			filename = name + "." + extend;
			return filename;

		}
		m = Pattern.compile("^(.+)\\.([0-9a-zA-Z]+)$").matcher(filename);
		if (m.find()) {
			String name = m.group(1) ;//+ "_" + this.getId();
			String extend = m.group(2);

//				System.err.println(String.format("Name: %s", name));
//				System.err.println(String.format("Extend: %s", extend));
			filename = name + "." + extend;
			return filename;
		}

		m = Pattern.compile("^(.+)(_\\d*)$").matcher(filename);
		if (m.find()) {
			String name = m.group(1);// + "_" + this.getId();
			filename = name;

			return filename;
		}

		m = Pattern.compile("^(.+)$").matcher(filename);
		if (m.find()) {
			String name = m.group(1) ;//+ "_" + this.getId();
//				System.err.println(String.format("Name: %s", name));
//				System.err.println(String.format("Extend: %s", extend));
			filename = name;

			return filename;
		}
		return filename;
	}
	
	
	public List<VideoEntity> getListEntitys(int _page, int _limit, String sort, String _search) {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = null;
		if (_search.length() == 0) {
			sql = "Select c from " + VideoEntity.class.getName() + " c " //
					+ " where c.deleted=0 ";
		} else {
			sql = "Select c from " + VideoEntity.class.getName() + " c " //
					+ " where c.deleted=0 and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}
		
		
		
		sql += " group by c.id  order by  ";
		String sqlSort = "";
		sort = sort.toLowerCase();

		String[] a = sort.split(",");
		boolean started = true;
		for (String str : a) {
			int index = str.indexOf(':');
			String _order = str.substring(index + 1);
			String tmpSort = str.substring(0, index);
			switch (tmpSort) {
			case "id":
				sqlSort += WebUtils.sort(_order, "c.id", started);
				break;
			
			case "price":
				sqlSort += WebUtils.sort(_order, "c.price", started);
				break;
			case "updateat":
				sqlSort += WebUtils.sort(_order, "c.updateAt", started);
				break;
			default:
				break;
			}
			started = false;
			sql += sqlSort;
			sqlSort = "";
		}
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql, VideoEntity.class);
		query.setFirstResult(_page * _limit);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}

	public long getCount(String _search) {
		String sql = null;
		if (_search == null || _search.length() == 0) {
			sql = "Select count(*) from " + VideoEntity.class.getName() + " c " //
					+ " where c.deleted=0 ";

		} else {
			sql = "Select count(*) from " + VideoEntity.class.getName() + " c " //
					+ " where c.deleted=0 and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}

		
		
		Query query = this.entityManager.createQuery(sql, Long.class);
		if (_search != null && _search.length() != 0) {
			query.setParameter("search", _search);
		}
		return (long) query.getSingleResult();
	}
	
	@Transactional
	public VideoEntity mergePart(VideoEntity p) {
		entityManager.merge(p);
		entityManager.flush();
		return  p;
	}
	
	public VideoEntity getEntity(Long id) {
		try {
			
			String sql = "Select c from " + VideoEntity.class.getName() + " c " //
					+ " where  c.id= :id ";
			Query query = this.entityManager.createQuery(sql, VideoEntity.class);
			query.setParameter("id", id);
			return (VideoEntity) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
