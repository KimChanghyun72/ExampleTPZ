package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;


public class SolveDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static SolveDAO instance;
	public static SolveDAO getInstance() {
		if(instance==null)
			instance=new SolveDAO();
		return instance;
	}
	
	
	public int insert(String solve_type, int solve_cnt) {
		int r=0;
		try {
			//1.DB연결
			conn = ConnectionManager.getConnnect();
			//2.sql 구문 실행
			//String seqSql = "select no from solve_seq where tablename = 'solve'";
			String sql = "INSERT INTO SOLVE (SOLVE_ID, SOLVE_SCORE, MEMBER_ID, SOLVE_DATE, SOLVE_TIME, SOLVE_TYPE, SOLVE_CNT) "
									+ " values('1', null, 'MEM01', sysdate, null, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, solve_type);
			pstmt.setInt(2, solve_cnt);
			r = pstmt.executeUpdate();
			//3.결과 처리
				System.out.println(r+"건이 처리됨.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//4.연결 해제
			//db에 접속가능한 세션의 수는 제한됨. 따라서 접속끝나면 연결해제해줘야 됨.
			ConnectionManager.close(conn);
		}
		return r;
	
	}//end of insert
}
