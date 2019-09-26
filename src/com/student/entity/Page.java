package com.student.entity;

import java.util.List;

//分页帮助类
public class Page<T> { 

		private int totalCount; //总数据

	    private int totalPage; //总页数
 
	    private int currentPage; //当前页

	    private int pageSize; //当前页面大小

	    private List<T> datas; //当前页的数据集合

	    public Page() {
		}
		public Page(int totalCount, int totalPage, int currentPage, int pageSize) {
			super();
			this.totalCount = totalCount;
			this.totalPage = totalPage;
			this.currentPage = currentPage;
			this.pageSize = pageSize;
		}
		public Page(int totalCount, int totalPage, int currentPage, int pageSize, List<T> datas) {
			super();
			this.totalCount = totalCount;
			this.totalPage = totalPage;
			this.currentPage = currentPage;
			this.pageSize = pageSize;
			this.datas = datas;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public int getCurrentPage() {
			return currentPage;
		}
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public List<T> getDatas() {
			return datas;
		}
		public void setDatas(List<T> datas) {
			this.datas = datas;
		}

		
		

	    
}