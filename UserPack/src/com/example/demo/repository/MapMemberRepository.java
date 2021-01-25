package com.example.demo.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.domain.Member;



public class MapMemberRepository implements MemberRepository {
	private final Map<String, Member> map = new HashMap<>();
	
	public void addMember(Member member) {
		map.put(member.getId(), member);
		
	}
	public Member findByMember(Member member) throws Exception {
		boolean hasMemer = map.containsValue(member);
		
		if (hasMemer) {
			return member;		
		} else {
			throw new Exception("아이디/패스워드를 확인해주세요.");
		}
	}
	public List<String> findIdAll() {
		return new ArrayList<>(map.keySet());
	}
}
