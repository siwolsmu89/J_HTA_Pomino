package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Branch;

public class BranchDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 Branch 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 Branch 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private Branch resultSetToBranch(ResultSet rs) throws SQLException {
		Branch branch = new Branch();
		
		branch.setNo(rs.getInt("branch_no"));
		branch.setName(rs.getString("branch_name"));
		branch.setAddrFirst(rs.getString("branch_addr_first"));
		branch.setAddrSecond(rs.getString("branch_addr_second"));
		branch.setAddrDetail(rs.getString("branch_addr_detail"));
		branch.setTel(rs.getString("branch_tel"));
		branch.setRegDate(rs.getDate("branch_reg_date"));
		branch.setParkingYn(rs.getString("branch_parking_yn"));
		branch.setOpenTime(rs.getString("branch_open_time"));
		branch.setCloseTime(rs.getString("branch_close_time"));
		branch.setComment(rs.getString("branch_comment"));
		branch.setDiscountRate(rs.getDouble("branch_discount_rate"));
		branch.setQuitYn(rs.getString("branch_quit_yn"));
		
		return branch;
	}
	
	public List<Branch> getAllBranch() throws SQLException {
		List<Branch> branchs = new ArrayList<Branch>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.getAllBranch"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Branch branch = new Branch();
			branch = resultSetToBranch(rs);
			branchs.add(branch);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return branchs;
	}
	
	/**
	 * 매장번호로 매장정보를 조회하는 메소드
	 * @param branchNo 매장번호
	 * @return 조회에 성공할 경우 매장 정보가 담긴 Branch 객체를 반환, 실패시 null 반환
	 * @throws SQLException
	 * @author 민석
	 */
	public Branch getBranchByNo(int branchNo) throws SQLException {
		Branch branch = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.getBranchByNo"));
		pstmt.setInt(1, branchNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			branch = resultSetToBranch(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return branch;
	}
	
	/**
	 * 
	 * @param branchNo
	 * @return
	 * @throws SQLException
	 */
	public Branch getBranchByName(String branchName) throws SQLException {
		Branch branch = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.getBranchByName"));
		pstmt.setString(1, branchName);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			branch = resultSetToBranch(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return branch;
	}
	
	/**
	 * 신규매장을 등록하는 메소드
	 * @param branch 매장객체
	 * @throws SQLException
	 * @author 연성
	 */
	public void insertBranch(Branch branch) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.insertBranch"));
		pstmt.setString(1, branch.getName());
		pstmt.setString(2, branch.getAddrFirst());
		pstmt.setString(3, branch.getAddrSecond());
		pstmt.setString(4, branch.getAddrDetail());
		pstmt.setString(5, branch.getTel());
		pstmt.setString(6, branch.getOpenTime());
		pstmt.setString(7, branch.getCloseTime());
		pstmt.setString(8, branch.getComment());
		pstmt.setString(9, branch.getImageSrc());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}

}







