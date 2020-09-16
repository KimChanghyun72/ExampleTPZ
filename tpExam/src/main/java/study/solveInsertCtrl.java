package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PaperheadDAO;
import model.PaperheadVO;
import model.ProblemDAO;
import model.ProblemVO;
import model.SolveDAO;

public class solveInsertCtrl implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//문제지 헤더 검색조건 찾아오기
		//if조건으로 기출&모의 / 해시태그 분기. 해시태그라면 problem_hashtag에서 해시태그 select
		String paper_type_cd = request.getParameter("paper_type_cd");
		String paper_round = request.getParameter("paper_round");
		int solve_cnt = Integer.parseInt(request.getParameter("solve_cnt"));
		
		PaperheadVO paperheadVO = new PaperheadVO();
		paperheadVO.setPaper_type_cd(paper_type_cd);
		paperheadVO.setPaper_round(paper_round);
		
		System.out.println(paperheadVO.getPaper_type_cd()+","+paperheadVO.getPaper_round()+","+solve_cnt);
		//기본키 삽입, type_cd와 round는 그대로임
		paperheadVO = PaperheadDAO.getInstance().selectOne(paperheadVO);
		
		System.out.println( "페이퍼헤드아디"+paperheadVO.getPaperhead_id()+paperheadVO.getPaper_type_cd()+paperheadVO.getPaper_round());
		//응시 insert
		SolveDAO.getInstance().insert(paperheadVO.getPaper_type_cd(), solve_cnt);
		
		//선택기준에 맞는 문제 selectAll
		ArrayList<ProblemVO> problemList = ProblemDAO.getInstance().selectByType(paperheadVO.getPaperhead_id());
		
		System.out.println("문제내역"+problemList);
		request.setAttribute("problemList", problemList);
		request.getRequestDispatcher("studyPaper.jsp").forward(request, response);
		
	}

}
