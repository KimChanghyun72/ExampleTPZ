package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionManager;

public class PaperheadDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static PaperheadDAO instance;
	public static PaperheadDAO getInstance() {
		if(instance==null)
			instance=new PaperheadDAO();
		return instance;
	}
	
	public ArrayList<PaperheadVO> selectAll(){
		PaperheadVO resultVO = null;
		ArrayList<PaperheadVO> list = new ArrayList<PaperheadVO>();
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT paperhead_id, paper_type_cd, paper_round "
					+ "FROM paperhead";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new PaperheadVO();
				
				resultVO.setPaperhead_id(rs.getString("paperhead_id"));
				resultVO.setPaper_type_cd(rs.getString("paper_type_cd"));
				resultVO.setPaper_round(rs.getString("paper_round"));
				
				list.add(resultVO);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public PaperheadVO selectOne(PaperheadVO paperheadVo) {
		PaperheadVO resultVO = new PaperheadVO(); 
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select paperhead_id, PAPER_TYPE_CD, PAPER_ROUND from paperhead where PAPER_TYPE_CD=? and PAPER_ROUND=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperheadVo.getPaper_type_cd());
			pstmt.setString(2, paperheadVo.getPaper_round());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO.setPaperhead_id(rs.getString("paperhead_id"));
				resultVO.setPaper_type_cd(rs.getString("paper_type_cd"));
				resultVO.setPaper_round(rs.getString("paper_round"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}	
		
		return resultVO;
	}
}
