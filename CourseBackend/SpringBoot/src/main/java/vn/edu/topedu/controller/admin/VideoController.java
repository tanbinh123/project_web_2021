package vn.edu.topedu.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.dao.VideoDAO;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.utils.WebUtils;

@Controller
public class VideoController {
	@Autowired
	VideoDAO resourceImageDAO;

	@GetMapping("/admin/videos")
	public String getList(@RequestParam(defaultValue = "1") int _page, @RequestParam(defaultValue = "3") int _limit,
			Map<String, Object> model, HttpServletRequest httpServletRequest) {
		_page = _page <= 0 ? 1 : _page;
		List<VideoEntity> data = resourceImageDAO.getVideoEntitys(_limit, _page);
		for (VideoEntity r : data) {
			r.setBeforeResource(WebUtils.getUrl(httpServletRequest));
		}
		long totals = resourceImageDAO.getCountResourceImages();

		model.put("pageResponse", new PageResponse<VideoEntity>(data, _limit, _page, totals, null));
		return "upload/videos";
	}

	@GetMapping("/admin/video-delete")
	public String getList2(@RequestParam(defaultValue = "1") int _page, @RequestParam long id,
			@RequestParam(defaultValue = "5") int _limit, Map<String, Object> model,
			HttpServletRequest httpServletRequest) {
		resourceImageDAO.deleteImage(id);
		_page = _page <= 0 ? 1 : _page;
		List<VideoEntity> data = resourceImageDAO.getVideoEntitys(_limit, _page);
		for (VideoEntity r : data) {
			r.setBeforeResource(WebUtils.getUrl(httpServletRequest));
		}
		long totals = resourceImageDAO.getCountResourceImages();

		model.put("pageResponse", new PageResponse<VideoEntity>(data, _limit, _page, totals, null));
		return "upload/videos";
	}

}
