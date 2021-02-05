package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class ListCommand implements Command{

	public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		System.out.println(">>ListCommand.execute()~~");
		//1. DB연결하고 데이터 가져오기
		List<EmployeeVO> list = DAO.getList();
		
		//2. 응답페이지(list.jsp)에 데이터 전달(request 객체에 속성값으로 전달)
		request.setAttribute("list", list);
		
		return "list.jsp";
	}
}
