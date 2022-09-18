package Bean;

import java.util.List;

import org.springframework.stereotype.Component;

public class Page {
    private int totalRecord;
    private int pageSize; 
    private int totalPage;
    private int startIndex;
    private int currentPage; 


    private List tradelist =null;

    public Page(int pageNum, int totalRecord) {
        this.currentPage = pageNum;
        this.totalRecord = totalRecord;

        this.pageSize = 5;
        this.startIndex = (this.currentPage - 1) * this.pageSize;
        if (this.totalRecord % this.pageSize == 0) {
            this.totalPage = this.totalRecord / this.pageSize;
        } else {
            this.totalPage = this.totalRecord / this.pageSize + 1;
        }

    }

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List getTradelist() {
		return tradelist;
	}

	public void setTradelist(List tradelist) {
		this.tradelist = tradelist;
	}

	
	



 
}
