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
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.utils.WebUtils;

@Controller
public class ImageController {
	@Autowired
	ResourceImageDAO resourceImageDAO;

	@GetMapping("/admin/images")
	public String getList(@RequestParam(defaultValue = "1") int _page, @RequestParam(defaultValue = "5") int _limit,
			Map<String, Object> model, HttpServletRequest httpServletRequest) {
		_page = _page <= 0 ? 1 : _page;
		List<ResourceImage> data = resourceImageDAO.getResourceImages(_limit, _page);
		for (ResourceImage r : data) {
			r.setBeforeResource(WebUtils.getUrl(httpServletRequest));
		}
		long totals = resourceImageDAO.getCountResourceImages();

		model.put("pageResponse", new PageResponse<ResourceImage>(data, _limit, _page, totals, null));
		return "upload/images";
	}

	@GetMapping("/admin/image-delete")
	public String getList2(@RequestParam(defaultValue = "1") int _page, 
			@RequestParam long id,
			@RequestParam(defaultValue = "5") int _limit,
			Map<String, Object> model, HttpServletRequest httpServletRequest) {
		resourceImageDAO.deleteImage(id);
		_page = _page <= 0 ? 1 : _page;
		List<ResourceImage> data = resourceImageDAO.getResourceImages(_limit, _page);
		for (ResourceImage r : data) {
			r.setBeforeResource(WebUtils.getUrl(httpServletRequest));
		}
		long totals = resourceImageDAO.getCountResourceImages();

		model.put("pageResponse", new PageResponse<ResourceImage>(data, _limit, _page, totals, null));
		return "upload/images";
	}

}
