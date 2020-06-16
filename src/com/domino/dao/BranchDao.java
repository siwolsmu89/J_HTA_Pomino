package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

}
