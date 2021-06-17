package com.team.Project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team.Project.domain.ProductAttachVO;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j2
public class UploadController {
		// 날짜형 폴더 생성 메서드
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			
			Date date = new Date();
			
			String str = sdf.format(date);
			
			return str.replace("-", File.separator);
		}
		
		// 이미지 타입 여부 검사 메서드
		private boolean checkImageType(File file) {
			try {
				String contentType = Files.probeContentType(file.toPath());
				
				return contentType.startsWith("image");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		
		@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public ResponseEntity<List<ProductAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
			
			log.info("update ajax post.........");
			
	        List<ProductAttachVO> list = new ArrayList<>();
	        String uploadFolder = "C:\\upload";
	 
	        String uploadFolderPath = getFolder();
	        // make folder
	        File uploadPath = new File(uploadFolder, uploadFolderPath);
	 
	        if (uploadPath.exists() == false) {
	            uploadPath.mkdirs();
	        }
	 
	        // make yyyy/MM/dd folder
	        for (MultipartFile multipartFile : uploadFile) {
	        	
	        	ProductAttachVO vo = new ProductAttachVO();
	        	
	            String uploadFileName = multipartFile.getOriginalFilename();
	            
	            String uploadFileType = multipartFile.getContentType();
	            
	            log.info("FileType :" + uploadFileType);
	 
	            // IE has file path
	            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
	            log.info("only file name : " + uploadFileName);
	            vo.setFileName(uploadFileName);
	            
	            //유니크한 파일명 만들기
	            UUID uuid = UUID.randomUUID();
	 
	            uploadFileName = uuid.toString() + "_" + uploadFileName;
	            
	        	// 파일 저장
	            File saveFile = new File(uploadPath, uploadFileName);
	            try {
	                
	                multipartFile.transferTo(saveFile);
	 
	                vo.setUuid(uuid.toString());
	                vo.setUploadPath(uploadFolderPath);
	 
	                // check image type file
	                if (checkImageType(saveFile)) {
	                    vo.setFileType(true);
	 
	                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
	 
	                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 500, 400);
	                   
	 
	                    thumbnail.close();
	                }
	 
	                // add to list
	                list.add(vo);
	            } catch (Exception e) {
	                log.error(e.getMessage());
	            }
	        } // end for
	        return new ResponseEntity<>(list, HttpStatus.OK);
	 
	    }
		
		@GetMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName){
			log.info("fileName:" + fileName);
			
			File file = new File("c:\\upload\\" + fileName);
			
			log.info("file :" + file);
			
			ResponseEntity<byte[]> result = null;
			
			
			
			try {
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", Files.probeContentType(file.toPath()));
				
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
		
		@PostMapping("/deleteFile")
		@ResponseBody
		public ResponseEntity<String> deleteFile(String fileName, String type){
			
			log.info("deleteFile: " + fileName);
			
			File file;
			
			try {
				file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
				
				file.delete();
				
				if(type.equals("image")) {
					String largeFileName = file.getAbsolutePath().replace("s_", "");
					
					log.info("largeFileName :" + largeFileName);
					
					file = new File(largeFileName);
					
					file.delete();
					
				}
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
}
