package vn.edu.topedu.response;

import java.util.List;

import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.json.JsonFactoryUltis;
import vn.edu.topedu.json.JsonResponse;

public class PageResponse<T> implements JsonResponse {

	private List<T> data;
	private Pagination pagination;

	public PageResponse(List<T> lstCourse, int _limit, int _page, long countRows, Pagination pagination) {
		super();
		this.data = lstCourse;
		if (pagination == null)
			this.pagination = new Pagination();
		else
			this.pagination = pagination;
		this.pagination.set_limit(_limit);
		this.pagination.set_page(_page);
		this.pagination.set_totalRows(countRows);
	}

	public PageResponse() {
		super();
	}

	public static class Pagination implements JsonResponse {
		private int _limit;
		private int _page;
		private long _totalRows;
		private String _sort;
		

		public Pagination(int _limit, int _page, long _totalRows, String _sort) {
			super();
			this._limit = _limit;
			this._page = _page;
			this._totalRows = _totalRows;
			this._sort = _sort;
			
		}

		public Pagination() {
			super();
		}

		public int get_limit() {
			return _limit;
		}

		public void set_limit(int _limit) {
			this._limit = _limit;
		}

		public int get_page() {
			return _page;
		}

		public void set_page(int _page) {
			this._page = _page;
		}

		public long get_totalRows() {
			return _totalRows;
		}

		public void set_totalRows(long _totalRows) {
			this._totalRows = _totalRows;
		}

		public String get_sort() {
			return _sort;
		}

		public void set_sort(String _sort) {
			this._sort = _sort;
		}

	

	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	@Override
	public String toJsonString() {
		return JsonResponse.super.toJsonString();
	}

}
