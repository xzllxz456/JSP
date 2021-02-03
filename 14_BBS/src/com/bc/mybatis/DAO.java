package com.bc.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

// 게시글 + 댓글 처리용
public class DAO {

	// 게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession session = DBService.getFactory().openSession();
		int totalCount = session.selectOne("BBS.totalCount");
		session.close();
		return totalCount;
	}
	
	// 페이지에 해당하는 글 목록(게시글) 가져오기
	public static List<BBSVO> getList(Map<String, Integer> map) {
		SqlSession session = DBService.getFactory().openSession();
		List<BBSVO> list = session.selectList("BBS.list", map);
		session.close();
		
		return list;
		
	}
	
	// 게시글 번호에 해당하는 게시글 하나 조회
	public static BBSVO selectOne(String b_idx) {
		SqlSession session = DBService.getFactory().openSession();
		BBSVO vo = session.selectOne("BBS.one", b_idx);
		session.close();
		
		return vo;
		
	}
	
	// 게시글 입력 처리
	public static int insert(BBSVO bvo) {
		SqlSession session = DBService.getFactory().openSession(true);
		int res = session.insert("BBS.insert", bvo);
		session.close();
		
		return res;
	}
	
	//조회수 증가 처리
	public static int updateHit(int b_idx) {
		SqlSession session = DBService.getFactory().openSession(true);
		int res = session.update("BBS.hit", b_idx);
		session.close();
		return res;
	}
	
	//======================댓글관련=============================
	public static List<CommVO> getCommList(String b_idx) {
		SqlSession session = DBService.getFactory().openSession();
		List<CommVO> list = session.selectList("BBS.commList", b_idx);
		session.close();
		return list;
	}
	
	public static int insertComment(CommVO cvo) {
		SqlSession session = DBService.getFactory().openSession(true);
		int res = session.insert("BBS.c_insert", cvo);
		session.close();
		return res;
		
	}
}
