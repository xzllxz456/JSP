package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.command.Command;
import com.bc.model.command.DeptCommand;
import com.bc.model.command.DeptListCommand;
import com.bc.model.command.FullnameCommand;
import com.bc.model.command.FullnameListCommand;
import com.bc.model.command.ListCommand;
import com.bc.model.command.SearchCommand;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/controller")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행~~");
		//파라미터 값 확인
		String type = request.getParameter("type");
		System.out.println("> type : "+ type);
		Command command = null;
		//작업 요청에 대한 처리
		if ("all".equals(type)) {
			command = new ListCommand();
		} else if("dept".equals(type)) {
			command = new DeptCommand();
		} else if("deptList".equals(type)) {
			command = new DeptListCommand();
		} else if("fullname".equals(type)) {
			//fullname.jsp 페이지로 응답처리(페이지 전환 이동)
			command = new FullnameCommand();
		} else if("fullnameList".equals(type)) {
			command = new FullnameListCommand();
		} else if("search".equals(type)) {
			command = new SearchCommand();
		}
		String path = command.execute(request, response);
		//응답 페이지 이동(searchList.jsp)
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>FrontController.doPost() 실행~~ ");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
