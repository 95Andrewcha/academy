package com.academy.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.academy.vo.AttachVO;

public class Common {
	/**
	 * 자료게시판 파일 저장 경로 - <b>"c:\\board"</b>
	 */
	public static final String BOARD_REPO = "C:\\board\\";
	
	/**
	 * 파일 업로드
	 * @param multipartRequest
	 * @return 파일 업로드 결과 데이터
	 * @throws Exception
	 */
	public static Map<String, Object> uploadFile(MultipartHttpServletRequest multipartRequest) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		Enumeration<String> paramNames = multipartRequest.getParameterNames();
		
		while(paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			paramMap.put(name, value);
		}
		
		List<AttachVO> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String name = fileNames.next();
			List<MultipartFile> files = multipartRequest.getFiles(name);
			
			for(MultipartFile mFile : files) {
				AttachVO attachVO = new AttachVO();
				String oriFileName = mFile.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				
				attachVO.setFile_name(oriFileName);
				attachVO.setFile_type("I");
				attachVO.setUuid(uuid);
				attachVO.setUpload_path(BOARD_REPO);
				
				fileList.add(attachVO);
				
				File file = new File(BOARD_REPO + uuid + oriFileName);
				
				if(mFile.getSize() > 0) { // 파일 NULL 체크
					if(!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
						if(file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리 생성
							file.createNewFile();
						}
					}
					
					mFile.transferTo(file);
				}
			} // end for
		} // end while
		
		paramMap.put("fileList", fileList);
		
		return paramMap;
	}
	
	/**
	 * 파일 삭제
	 * @param multipartRequest
	 * @return 파일 삭제 결과 데이터
	 * @throws Exception
	 */
	public static List<AttachVO> deleteFile(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<AttachVO> fileList = new ArrayList<>();
		String[] delFiles = multipartRequest.getParameterValues("delete_files");
		
		for(String delFile : delFiles) {
			String[] delFileSplit = delFile.split("_");
			File file = new File(BOARD_REPO + delFileSplit[0] + delFileSplit[1]);
			
			if(file.exists()) {
				AttachVO attachVO = new AttachVO();
				
				attachVO.setUuid(delFileSplit[0]);
				attachVO.setFile_type("I");
				attachVO.setFile_name(delFileSplit[1]);
				attachVO.setUpload_path(BOARD_REPO);
				
				fileList.add(attachVO);
				
				file.delete();
			}
		}

		return fileList;
	}
}
