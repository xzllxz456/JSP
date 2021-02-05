package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class SearchCommand implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println(">>>idx : " + idx + " , keyword : " + keyword);
		String path = "";
		if(keyword == null || keyword.equals("")) {
			//search.jsp로 이동
			path = "search.jsp";
		} else {	// 검색값이 입력되었으니 DB에서 검색 처리
			List<EmployeeVO> list = DAO.getSearch(idx, keyword);
			System.out.println(">> 동적 검색 결과 list : " + list);
			
			//동적 검색 형태 확인
			String title = "";
			switch(idx) {
				case "0" : title = "사번"; break;
				case "1" : title = "이름"; break;
				case "2" : title = "직종"; break;
				case "3" : title = "부서"; break;
			}
			
			// 동적 검색 결과 응답 페이지로 전달
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			path = "searchList.jsp";
		}
		return path;
	}
}
