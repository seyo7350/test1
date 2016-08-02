package sist.co.dto;

import java.io.Serializable;
import java.util.List;

public class PageDTO implements Serializable {

	private List<QnADTO> pList;
	private int curPage;
	private int perPage = 10;
	private int totalCount;
	public List<QnADTO> getpList() {
		return pList;
	}
	public void setpList(List<QnADTO> pList) {
		this.pList = pList;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	@Override
	public String toString() {
		return "PageDTO [pList=" + pList + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount="
				+ totalCount + "]";
	}
	
	
}
