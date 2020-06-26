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
		branch.setImageSrc(rs.getString("branch_image_src"));
		
		return branch;
	}
	
	/**
	 * 가맹점테이블의 모든 가맹점객체를 반환하는 메소드
	 * @return 모든 가맹점 객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	 * 페이지네이션 범위에 해당하는 모든 가맹점 객체를 반환하는 메소드
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 조건에 부합하는 모든 가맹점 객체 
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Branch> getAllBranch(int beginNumber, int endNumber) throws SQLException {
		List<Branch> branchs = new ArrayList<Branch>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.getBranchByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
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
	 * 가맹점테이블의 가맹점갯수를 반환하는 메소드
	 * @return 가맹점갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getBranchsCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.getBranchCount"));
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			count = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return count;
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
	 * 해당 가맹점명과 일치하는 가맹점
	 * @param branchName 가맹점명
	 * @return 가맹점명와 일치하는 가맹점
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
	 * 해당 가맹점명과 일치하는 가맹점 중에서 페이징처리 범위에 속하는 값을 반환한다.
	 * @param branchName 가맹점명
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 가맹점명 일치, 페이징처리 범위안의 가맹점
	 * @throws SQLException
	 */
	public List<Branch> getBranchByName(String branchName, int beginNumber, int endNumber) throws SQLException {
		List<Branch> branchs = new ArrayList<Branch>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.getBranchByNameWithRange"));
		pstmt.setString(1, branchName);
		pstmt.setInt(2, beginNumber);
		pstmt.setInt(3, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Branch branch = resultSetToBranch(rs);
			branchs.add(branch);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return branchs;
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
	
	/**
	 * 가맹점 정보를 수정하는 메소드
	 * @param branch 가맹점 정보
	 * @throws SQLException
	 * @author 연성
	 */
	public void updateBranch(Branch branch) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.updateBranch"));
		pstmt.setString(1, branch.getAddrDetail());
		pstmt.setString(2, branch.getTel());
		pstmt.setString(3, branch.getParkingYn());
		pstmt.setString(4, branch.getOpenTime());
		pstmt.setString(5, branch.getCloseTime());
		pstmt.setString(6, branch.getComment());
		pstmt.setDouble(7, branch.getDiscountRate());;
		pstmt.setString(8, branch.getImageSrc());
		pstmt.setInt(9, branch.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 가맹점 영업시작/종료 정보를 업데이트하는 메소드
	 * @param branch 영업시작/종료, 가맹점번호 값을 갖고있는 가맹점 객체
	 * @throws SQLException
	 * @author 연성
	 */
	public void updateBranchQuitYn(Branch branch) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.updateBranchQuitYn"));
		pstmt.setString(1, branch.getQuitYn());
		pstmt.setInt(2, branch.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	
	/**
	 * 주소(대분류)에 해당하는 가맹점 값을 반환한다.
	 * @param first_addr 주소(대분류)
	 * @return 주소에 해당되는 가맹점
	 * @throws SQLException
	 */
	public Branch getBranchByAddr(String first_addr) throws SQLException {
		Branch branch = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.getBranchByAddr"));
		pstmt.setString(1, first_addr);
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
	 * 주소(대분류)에 해당하는 가맹점 중에서 페이징처리 범위에 속하는 값을 반환한다.
	 * @param first_addr 주소(대분류)
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 주소에 해당되고, 페이징처리 범위안에 포함되는 가맹점
	 * @throws SQLException
	 */
	public List<Branch> getBranchByAddr(String first_addr, int beginNumber, int endNumber) throws SQLException {
		List<Branch> branchs = new ArrayList<Branch>();
			
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("branch.getBranchByAddrWithRange"));
		pstmt.setString(1, first_addr);
		pstmt.setInt(2, beginNumber);
		pstmt.setInt(3, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Branch branch = resultSetToBranch(rs);
			branchs.add(branch);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return branchs;
	}
	
	
}








