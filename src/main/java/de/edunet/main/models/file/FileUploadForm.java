package de.edunet.main.models.file;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadForm{
 
	private List<MultipartFile> files;
	//getter and setter methods

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	} 
	
}