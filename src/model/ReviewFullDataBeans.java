package model;

import java.io.Serializable;

public class ReviewFullDataBeans implements Serializable {

	private ReviewDataBeans rdb;
	private String reviewer;
	private String reviewerIconFileName;

	public ReviewFullDataBeans() {};

	public ReviewDataBeans getRdb() {
		return rdb;
	}
	public void setRdb(ReviewDataBeans rdb) {
		this.rdb = rdb;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public String getReviewerIconFileName() {
		return reviewerIconFileName;
	}
	public void setReviewerIconFileName(String reviewerIconFileName) {
		this.reviewerIconFileName = reviewerIconFileName;
	}
}
