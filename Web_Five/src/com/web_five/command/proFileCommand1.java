package com.web_five.command;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class proFileCommand1 implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
				// 파일이 저장되는 실제 경로
				String realPath = request.getServletContext().getRealPath("resources/image");
				System.out.println(realPath);
				String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());  //현재시간
				System.out.println(now);
				int sizeLimit = 15 * 1024 * 1024;
				MultipartRequest multpartRequest = null;
				try {
					multpartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
					String filename = "";
					String filename1 = "";
					String filename2 = "";
					String rfile = multpartRequest.getFilesystemName("file1");
					String rfile1 = multpartRequest.getFilesystemName("file2");
					String rfile2 = multpartRequest.getFilesystemName("file3");
					String f_ext = "";
					if(rfile != null){
						File file_copy = new File(realPath+"/"+rfile);
						File file_copy1 = new File(realPath+"/"+rfile1);
						File file_copy2 = new File(realPath+"/"+rfile2);
						if(file_copy.exists()) {
							f_ext = rfile.substring(rfile.length()-3,rfile.length());
							File file2 = new File(realPath+"/"+now+"."+f_ext);
							File file3 = new File(realPath+"/"+now+"Detail."+f_ext);
							File file4 = new File(realPath+"/"+now+"Done."+f_ext);
							file_copy.renameTo(file2);
							file_copy1.renameTo(file3);
							file_copy2.renameTo(file4);
							filename = file2.getName();
							filename1 = file3.getName();
							filename2 = file4.getName();
							session.setAttribute("prdFilename", filename);
							session.setAttribute("prdDFilename", filename1);
							session.setAttribute("prdAFilename", filename2);
						}
					}
				}catch (Exception e) {
					// TODO: handle exceptio
					e.printStackTrace();
				}

				
			}
		}
