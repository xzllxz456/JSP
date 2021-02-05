package com.bc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 이름조회 
	public static List<EmployeeVO> getfullNameList(String fullname) {
		SqlSession session = DBService.getFactory().openSession();
		List<EmployeeVO> list = session.selectList("HR.fullNameList", fullname);
		session.close();
		
		return list;
	}
	
	//동적검색
	public static List<EmployeeVO> getSearch(String idx, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		SqlSession session = DBService.getFactory().openSession();
		List<EmployeeVO> list = session.selectList("HR.seach", map);
		session.close();
		
		return list;
		
	}
}
