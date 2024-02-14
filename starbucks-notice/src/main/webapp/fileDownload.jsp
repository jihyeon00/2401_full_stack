<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*, java.io.*, java.text.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String fileName = request.getParameter("filename");
	String fileNameEncoding = URLEncoder.encode(fileName, "utf-8");	// encode 한글처리
	
	String savePath = "D:\\2401_full_stack\\starbucks-notice\\src\\main\\webapp\\upload-files";
	File file = new File(savePath + "\\" + fileName);
	
	// File 다운로드 처리 Header설정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment;filename=" + fileNameEncoding + ";");
	
	// out객체 초기화
	out.clear();
	pageContext.pushBody();
	
	// File 다운로드 처리
	BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
	
	int read = 0;
	byte b[] = new byte[1024 * 4];
	while ((read = fin.read(b)) != -1) {
		outs.write(b, 0, read);
	}
	outs.flush();
	outs.close();
	fin.close();
%>