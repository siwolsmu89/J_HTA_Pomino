<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String searchOpt = request.getParameter("searchOpt");
	String searchValue = request.getParameter("searchValue");
	int beginNumber = NumberUtil.stringToInt(request.getParameter("beginNumber"));
	int endNumber = NumberUtil.stringToInt(request.getParameter("endNumber"));
	
	BranchDao branchDao = new BranchDao();
	Branch branch = new Branch();
	List<Branch> branchs = new ArrayList<Branch>();
	
	if("branchno".equals(searchOpt)){
		if(searchValue.isEmpty()){
			branchs = branchDao.getAllBranch(beginNumber, endNumber);
		} else {
			branch = branchDao.getBranchByNo(NumberUtil.stringToInt(searchValue));
			branchs.add(branch);			
		}
	} else if("branchname".equals(searchOpt)){
		branchs = branchDao.getBranchByName(searchValue, beginNumber, endNumber);
	} else if("branchaddr".equals(searchOpt)){
		branchs = branchDao.getBranchByAddr(searchValue, beginNumber, endNumber);
		// getBranchByAddrWithRange
	}
	
	Gson gson = new Gson();
	String jsonContent = gson.toJson(branchs);
	
	out.write(jsonContent);
%>