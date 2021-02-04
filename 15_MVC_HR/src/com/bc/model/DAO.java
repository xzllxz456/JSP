package com.bc.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.EmployeeVO;
import com.bc.mybatis.DBService;

public class DAO {
	// 직원 전체 목록 조회
	public static List<EmployeeVO> getList() {
		SqlSession session = DBService.getFactory().openSession();
		List<EmployeeVO> list = session.selectList("HR.list");
		session.close();
		
		return list;
	}
	
	// 부서 번호 나열
	public static List<EmployeeVO> getDepList(String department_id) {
		SqlSession session = DBService.getFactory().openSession();
		List<EmployeeVO> list = session.selectList("HR.deptlist", department_id);
		session.close();
		
		return list;
	}
}
