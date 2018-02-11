package model;

import java.io.Serializable;

import javax.servlet.http.Part;

public class ImageFileDataBeans implements Serializable {

	private Part part;
	private String filePath;
	private String fileName;

	public ImageFileDataBeans() {}

	public Part getPart() {
		return part;
	}

	public void setPart(Part part) {
		this.part = part;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	};

}
