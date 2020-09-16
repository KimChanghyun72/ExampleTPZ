package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;

public class ProblemDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static ProblemDAO instance;
	public static ProblemDAO getInstance() {
		if(instance==null)
			instance=new ProblemDAO();
		return instance;
	}
	
	public ArrayList<ProblemVO> selectByType(String paperhead_id) {
		ProblemVO resultVO = null;
		ArrayList<ProblemVO> list = new ArrayList<ProblemVO>();
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT problem_id, subject, haeseol, problem_text, ans_1, ans_2, ans_3, ans_4, "
					+ " ans_correct, paperhead_id, problem_image "
					+ " FROM problem where paperhead_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperhead_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new ProblemVO();
				resultVO.setProblem_id(rs.getString("problem_id"));
				resultVO.setSubject(rs.getString("subject"));
				resultVO.setHaeseol(rs.getString("haeseol"));
				resultVO.setProblem_text(rs.getString("problem_text"));
				resultVO.setAns_1(rs.getString("ans_1"));
				resultVO.setAns_2(rs.getString("ans_2"));
				resultVO.setAns_3(rs.getString("ans_3"));
				resultVO.setAns_4(rs.getString("ans_4"));
				resultVO.setAns_correct(rs.getInt("ans_correct"));
				resultVO.setPaperhead_id(rs.getString("paperhead_id"));
				resultVO.setProblem_image(rs.getString("problem_image"));
				
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
}
