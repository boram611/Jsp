package com.web_five.command;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class qnaFileUpdateCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		// 파일이 저장되는 실제 경로
		String realPath = request.getServletContext().getRealPath("resources/image");
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());  //현재시간
		int sizeLimit = 15 * 1024 * 1024;
		MultipartRequest multpartRequest = null;
		try {
			multpartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			String filename = "";
			String rfile = multpartRequest.getFilesystemName("file");
			String f_ext = "";
			if(rfile != null){
				File file_copy = new File(realPath+"/"+rfile);
				if(file_copy.exists()) {
					f_ext = rfile.substring(rfile.length()-3,rfile.length());
					File file2 = new File(realPath+"/"+now+"."+f_ext);
					file_copy.renameTo(file2);
					filename = file2.getName();
					session.setAttribute("filename", filename);
				}
			}
		}catch (Exception e) {
			// TODO: handle exceptio
			e.printStackTrace();
		}
	}
}
