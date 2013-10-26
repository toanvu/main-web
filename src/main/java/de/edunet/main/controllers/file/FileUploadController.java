package de.edunet.main.controllers.file;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import de.edunet.main.models.file.FileUploadForm;


@Controller
public class FileUploadController {
	private static final Logger LOG = LoggerFactory.getLogger(FileUploadController.class);
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String displayForm() {
        return "file_upload_form";
    }
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam("files[]") List<MultipartFile> files){
		LOG.debug("enter save file");
		System.out.println("enter save file : "+files.size());
		for (MultipartFile multipartFile : files) {
			 //TODO: save files to tmp ordner and gibt link zurück
			                String fileName = multipartFile.getOriginalFilename();
			               
			                //Handle file content - multipartFile.getInputStream()
			                System.out.println("file "+fileName+ " was uploaded");
		}
		return "file_upload_success";
	}
}
