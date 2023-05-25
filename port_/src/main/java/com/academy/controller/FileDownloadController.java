package com.academy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.common.Common;
import com.academy.vo.AttachVO;

import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	
	@RequestMapping("/download")
	protected void download(@ModelAttribute AttachVO attachVO, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = Common.BOARD_REPO + "\\"  + attachVO.getUuid() + attachVO.getFile_name();
		File image = new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + attachVO.getUuid() + attachVO.getFile_name());
		
		FileInputStream in = new FileInputStream(image); 
		byte[] buffer = new byte[1024 * 8];
		
		while(true) {
			int count = in.read(buffer);
			
			if(count==-1) {
				break;
			}

			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
	}
	
	@RequestMapping("/thumbnails")
	protected void thumbnails(@ModelAttribute AttachVO attachVO, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = Common.BOARD_REPO + "\\"  + attachVO.getUuid() + attachVO.getFile_name();
		File image = new File(filePath);
		InputStream in = new FileInputStream(image);
		
		if (image.exists()) { 
			//Thumbnails.of(image).size(121, 154).outputFormat("png").toOutputStream(out);
			Thumbnailator.createThumbnail(in, out, 100, 1000);
		}
		
		byte[] buffer = new byte[1024 * 8];
		
		out.write(buffer);
		out.close();
	}
}

