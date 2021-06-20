package vn.edu.topedu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.EvaluateEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Learning;
import vn.edu.topedu.entity.course.full.Lesson;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;
import vn.edu.topedu.utils.WebUtils;

@Repository
@Transactional
public class CourseDAO {
	@Autowired
	private EntityManager entityManager;

	public List<Course> getListCourse(int _page, int _limit, String sort, int category, String _search) {
		--_page;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = null;
		if (_search.length() == 0) {
			sql = "Select c from " + Course.class.getName() + " c " //
					+ " where c.deleted=0 ";
		} else {
			sql = "Select c from " + Course.class.getName() + " c " //
					+ " where c.deleted=0 and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}
		if (category != -1)
			sql += String.format(" and c.category.id = %d ", category);
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
			case "bought":
				sqlSort += WebUtils.sort(_order, "c.bought", started);
				break;
			case "ratestar":
				sqlSort += WebUtils.sort(_order, "c.rateStar", started);
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
		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setFirstResult(_page * _limit);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}

	public long getCount(int category, String _search) {
		String sql = null;
		if (_search == null || _search.length() == 0) {
			sql = "Select count(*) from " + Course.class.getName() + " c " //
					+ " where c.deleted=0 ";

		} else {
			sql = "Select count(*) from " + Course.class.getName() + " c " //
					+ " where c.deleted=0 and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}

		if (category != -1)
			sql += String.format(" and c.category.id = %d ", category);
		Query query = this.entityManager.createQuery(sql, Long.class);
		if (_search != null && _search.length() != 0) {
			query.setParameter("search", _search);
		}
		return (long) query.getSingleResult();
	}
//	

	public PreviewCourseEntity getPreviewCourse(Long idCourse) {
		String sql = "Select c from " + PreviewCourseEntity.class.getName() + " c " //
				+ " where c.deleted=0 and c.id= :id ";
		Query query = this.entityManager.createQuery(sql, PreviewCourseEntity.class);
		query.setParameter("id", idCourse);
		return (PreviewCourseEntity) query.getSingleResult();
	}

	public FullCourse getFullCourse(Long idCourse) {
		String sql = "Select c from " + FullCourse.class.getName() + " c " //
				+ " where c.deleted=0 and c.id= :id ";
		Query query = this.entityManager.createQuery(sql, FullCourse.class);
		query.setParameter("id", idCourse);
		return (FullCourse) query.getSingleResult();
	}
	public Part getPart(Long idCourse) {
		String sql = "Select c from " + Part.class.getName() + " c " //
				+ " where c.deleted=0 and c.id= :id ";
		Query query = this.entityManager.createQuery(sql, Part.class);
		query.setParameter("id", idCourse);
		return (Part) query.getSingleResult();
	}
	
	public Lesson getLesson(Long idCourse) {
		String sql = "Select c from " + Lesson.class.getName() + " c " //
				+ " where c.deleted=0 and c.id= :id ";
		Query query = this.entityManager.createQuery(sql, Lesson.class);
		query.setParameter("id", idCourse);
		return (Lesson) query.getSingleResult();
	}

	public Course getCourse(Long idCourse) {
		String sql = "Select c from " + Course.class.getName() + " c " //
				+ " where c.deleted=0 and c.id= :id ";
		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setParameter("id", idCourse);
		return (Course) query.getSingleResult();
	}
//	public List<Course> getCourse(int id) {
//		String sql = "Select c from " + Course.class.getName() + " c " //
//				+ " where c.deleted=0 and c.id= :id group by c.id order by c.id desc ";
//		Query query = this.entityManager.createQuery(sql, Course.class);
//		query.setParameter("id", id);
//		return query.getResultList();
//	}

	public Long insertCourse(Course course) {
		try {
			entityManager.persist(course);
			entityManager.flush();
			return course.getId();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return Long.parseLong(String.valueOf(0));
	}

	public Course updateCourse(Course course) {
		return entityManager.merge(course);
	}

	public ResourceImage findImageById(Long id) {
		if (id == null)
			return null;
		return this.entityManager.find(ResourceImage.class, id);
	}

	public VideoEntity findVideoById(Long id) {
		if (id == null)
			return null;
		return this.entityManager.find(VideoEntity.class, id);
	}

	public CategoryEntity findCatetoryById(Integer id) {
		return this.entityManager.find(CategoryEntity.class, id);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public FullCourse persistCourse(FullCourse course) throws Exception {
		entityManager.persist(course);
		entityManager.flush();
		return course;
	}

	@Transactional(rollbackFor = Exception.class)
	public FullCourse persistFullCourse(FullCourse course) throws Exception {
		if (course.getCategoryId() == null) {
			entityManager.persist(course.getCategory());
			entityManager.flush();
			course.setCategoryId(course.getCategory().getId());
			
			
		} else {
			course.getCategory().setId(course.getCategoryId());
		}
		if (course.getImagePosterId() == null) {
			System.err.println(course.getImagePoster().getImage());
			if (course.getImagePoster() != null && course.getImagePoster().checkExtendResource()) {
				entityManager.persist(course.getImagePoster());
				entityManager.flush();
				course.setImagePosterId(course.getImagePoster().getId());
			} else
				throw new Exception(String.format("rollBack, IsNull: %s", "getImgPosterId"));
		} else {
			course.setImagePoster(findImageById(course.getImagePosterId()));

		}
		if (course.getVideoDemoId() == null) {
			throw new Exception(String.format("rollBack, IsNull: %s", "getVideoDemoId"));
		} else {
			course.setDemo(findVideoById(course.getVideoDemoId()));

		}
		if (course.getLearnings() != null) {
			for (Learning l : course.getLearnings()) {
				l.setCourseId(course.getId());
				if (l.getId() == null) {
					if (l.getDeleted() == false)
						entityManager.persist(l);
				} else {
					entityManager.merge(l);
				}
				entityManager.flush();

			}
			int rs = deleteAllLearningDeleted();
			System.err.println("delete learning: " + rs);
		}

		if (course.getParts() != null) {
			for (Part part : course.getParts()) {
				part.setCourseId(course.getId());
				if (part.getId() == null) {
					if (part.getDeleted() == false)
						entityManager.persist(part);
				} else {
					entityManager.merge(part);
					if (part.getLessons() != null) {
						for (Lesson le : part.getLessons()) {
							le.setPartId(part.getId());
							if (le.getId() == null) {
								if (le.getDeleted() == false)
									entityManager.persist(le);
							} else {
								le.setVideo(findVideoById(le.getId()));
								entityManager.merge(le);
							}
							// System.err.println("");
						}

						deleteAllLessonDeleted();
					}
				}
				entityManager.flush();

			}
			int rs = deleteAllPartDeleted();
			System.err.println("delete part: " + rs);
		}
//		course.setCategory(findCatetoryById(course.getCategoryId()));
		//entityManager.detach(course.getCategory());
		System.err.println(course.getCategory());
		entityManager.persist(course);
		entityManager.flush();
//		rs.setCategory(findCatetoryById(rs.getCategoryId()));
//		rs.setPoster(findImageById(rs.getImgPosterId()));
		return course;
	}
	@Transactional(rollbackFor = Exception.class)
	public FullCourse merge(FullCourse course) throws Exception {
		FullCourse rs = entityManager.merge(course);
		return rs;
	}
	@Transactional(rollbackFor = Exception.class)
	public FullCourse updateFullCourse(FullCourse course) throws Exception {
		if (course.getCategoryId() == null) {
			entityManager.persist(course.getCategory());
			entityManager.flush();
			course.setCategoryId(course.getCategory().getId());
		} else {
			course.getCategory().setId(course.getCategoryId());
		}
		if (course.getImagePosterId() == null) {
			System.err.println(course.getImagePoster().getImage());
			if (course.getImagePoster() != null && course.getImagePoster().checkExtendResource()) {
				entityManager.persist(course.getImagePoster());
				entityManager.flush();
				course.setImagePosterId(course.getImagePoster().getId());
			} else
				throw new Exception(String.format("rollBack, IsNull: %s", "getImgPosterId"));
		} else {
			course.setImagePoster(findImageById(course.getImagePosterId()));

		}
		if (course.getVideoDemoId() == null) {
			throw new Exception(String.format("rollBack, IsNull: %s", "getVideoDemoId"));
		} else {
			course.setDemo(findVideoById(course.getVideoDemoId()));

		}
		if (course.getLearnings() != null) {
			for (Learning l : course.getLearnings()) {
				l.setCourseId(course.getId());
				if (l.getId() == null) {
					//System.err.println("Insert Le");
					if (l.getDeleted() == false) {
						
						entityManager.persist(l);
						
						//System.err.println(l);
					}
				} else {
					entityManager.merge(l);
				}
				entityManager.flush();

			}
			int rs = deleteAllLearningDeleted();
			System.err.println("delete learning: " + rs);
		}

		if (course.getParts() != null) {
			for (Part part : course.getParts()) {
				part.setCourseId(course.getId());
				if (part.getId() == null) {
					if (part.getDeleted() == false) {
						
						entityManager.persist(part);
						entityManager.flush();
						if (part.getLessons() != null) {
							for (Lesson le : part.getLessons()) {
								le.setPartId(part.getId());
								if (le.getId() == null) {
									if (le.getDeleted() == false) {
										
										entityManager.persist(le);
										entityManager.flush();
										System.err.println(le);
									}
								} 
							}

							
							System.err.println("delete lesson: " + deleteAllLessonDeleted());
						}
					}
						
				} else {
					entityManager.merge(part);
					if (part.getLessons() != null) {
						for (Lesson le : part.getLessons()) {
							le.setPartId(part.getId());
							if (le.getId() == null) {
								if (le.getDeleted() == false) {
									
									entityManager.persist(le);
									entityManager.flush();
									System.err.println(le);
								}
							} else {
								le.setVideo(findVideoById(le.getId()));
								entityManager.merge(le);
							}
							// System.err.println("");
						}

						
						System.err.println("delete lesson: " + deleteAllLessonDeleted());
					}
				}
				entityManager.flush();

			}
			int rs = deleteAllPartDeleted();
			System.err.println("delete part: " + rs);
		}
//		course.setCategory(findCatetoryById(course.getCategoryId()));
		FullCourse rs = entityManager.merge(course);

//		rs.setCategory(findCatetoryById(rs.getCategoryId()));
//		rs.setPoster(findImageById(rs.getImgPosterId()));
		if (rs.getParts() != null)
			rs.getParts().forEach(e -> {
				if (e.getLessons() != null)
					e.getLessons().forEach(a -> {
						a.setVideo(this.entityManager.find(VideoEntity.class, a.getVideoId()));
					});
			});
		// rs.set
		return rs;
	}

	public boolean deleteCourse(int id) {

		int rs = entityManager.createNativeQuery("UPDATE course set deleted=? where id=? and deleted=0")
				.setParameter(1, 1).setParameter(2, id).executeUpdate();
		// System.out.println(rs);
		if (rs == 1)
			return true;
		return false;
	}

	public int deleteAllLearningDeleted() {

		int rs = entityManager.createNativeQuery("Delete from  learning where deleted=1").executeUpdate();
		return rs;
	}

	public int deleteAllPartDeleted() {

		int rs = entityManager.createNativeQuery("Delete from  part where deleted=1").executeUpdate();
		return rs;
	}

	public int deleteAllLessonDeleted() {

		int rs = entityManager.createNativeQuery("Delete from  lesson where deleted=1").executeUpdate();
		return rs;
	}

	public List<CategoryEntity> getCategories(int actived) {

		String sql = "Select c from CategoryEntity c " + " where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, CategoryEntity.class);
		// query.setParameter("id", idCourse);
		return query.getResultList();

	}

	public List<VideoEntity> getVideos(int actived) {

		String sql = "Select c from " + VideoEntity.class.getName() + " c  where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, VideoEntity.class);
		// query.setParameter("id", idCourse);
		return query.getResultList();

	}
	@Transactional
	public void updateLearnings(List<Learning> learnings, FullCourse course) throws Exception {
		for (Learning l : learnings) {
			l.setCourseId(course.getId());
			if (l.getId() == null) {
				if (l.getDeleted() == false) {
					entityManager.persist(l);
				}
			} else {
				Learning tmp = entityManager.find(Learning.class, l.getId());
				if(tmp.getCourseId()==course.getId())
				entityManager.merge(l);else {
					throw new Exception("Learning này thuộc về khóa học khác");
				}
			}

		}
		entityManager.flush();
		int rs = deleteAllLearningDeleted();
		entityManager.refresh(course);
		System.err.println(String.format("Delete %s row learning", rs));
	}
	
	@Transactional
	public Part persistPart(Part p) {
		entityManager.persist(p);
		entityManager.flush();
		return  p;
	}
	@Transactional
	public Lesson persistLesson(Lesson p) {
		entityManager.persist(p);
		entityManager.flush();
		return  p;
	}
	
	@Transactional
	public EvaluateEntity persistEvaluateEntity(EvaluateEntity p) {
		entityManager.persist(p);
		entityManager.flush();
		return  p;
	}
	@Transactional
	public Part mergePart(Part p) {
		entityManager.merge(p);
		entityManager.flush();
		return  p;
	}
	@Transactional
	public Lesson mergeLesson(Lesson p) {
		entityManager.merge(p);
		entityManager.flush();
		return  p;
	}
	
	@Transactional
	public Part deletePart(Part p) {
		p.setDeleted(true);
		mergePart(p);
		entityManager.flush();
		return  p;
	}
	
	@Transactional
	public Lesson deleteLesson(Lesson p) {
		p.setDeleted(true);
		mergeLesson(p);
		entityManager.flush();
		return  p;
	}

	
	
	public List<EvaluateEntity> getEvaluates(Long courseId, int _page, int _limit, String sort, String _search) {
		--_page;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = "Select c from " + EvaluateEntity.class.getName() + " c where courseId=:courseId and c.deleted=0 ";
		if (_search.length() != 0) {
					
			sql += " and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

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
		Query query = this.entityManager.createQuery(sql, EvaluateEntity.class);
		query.setParameter("courseId", courseId);
		query.setFirstResult(_page * _limit);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}
	
	public Long countEvaluates(Long courseId, String _search) {
		

		String sql = "Select count(*)  from " + EvaluateEntity.class.getName() + " c where courseId=:courseId and c.deleted=0 ";
		if (_search.length() != 0) {
					
			sql += " and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}
		
		sql += " group by c.id   ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql);
		query.setParameter("courseId", courseId);
		
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		
		return (Long) query.getSingleResult();
	}

}