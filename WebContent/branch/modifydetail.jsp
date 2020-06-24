<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String saveDirectory = application.getInitParameter("branchImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	
	// 정보수정시 이미지
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	BranchDao branchDao = new BranchDao();
	
	int branchNo = NumberUtil.stringToInt(mr.getParameter("branchno"));
	String yn = mr.getParameter("yn");
	System.out.println(yn);
	if(!yn.isEmpty()){
		Branch branch = branchDao.getBranchByNo(branchNo);
		if("y".equalsIgnoreCase(yn)){
			branch.setQuitYn("Y");
		} else {
			branch.setQuitYn("N");
		}
		
		// 영업종료/시작만 조작하는 메소드/프로펄티 필요
		branchDao.updateBranchQuitYn(branch);

	} else {
		String addrDetail = mr.getParameter("addrdetail");
		String tel = mr.getParameter("tel");
		String parkingYn = mr.getParameter("parkingyn");
		String openTime = mr.getParameter("opentime");
		String closeTime = mr.getParameter("closetime");
		String comment = mr.getParameter("comment");
		double discountRate = NumberUtil.stringToDouble(mr.getParameter("discount"));
		String imageSrc = mr.getFilesystemName("upfile"); 
		
		System.out.println("addrDetail:"+addrDetail);
		System.out.println("tel:"+tel);
		System.out.println("parkingYn:"+parkingYn);
		System.out.println("openTime:"+openTime);
		System.out.println("closeTime:"+closeTime);
		System.out.println("comment:"+comment);
		System.out.println("discountRate:"+discountRate);
		System.out.println("imageSrc:"+imageSrc);
		
		Branch oldBranch = branchDao.getBranchByNo(branchNo);
		oldBranch.setAddrDetail(addrDetail);
		oldBranch.setTel(tel);
		oldBranch.setParkingYn(parkingYn);
		oldBranch.setOpenTime(openTime);
		oldBranch.setCloseTime(closeTime);
		oldBranch.setComment(comment);
		oldBranch.setDiscountRate(discountRate);
		if(imageSrc != null){
			oldBranch.setImageSrc(imageSrc);
		}
		
		branchDao.updateBranch(oldBranch);		
	}
	
	response.sendRedirect("/domino/branch/branchdetail.jsp");
%>