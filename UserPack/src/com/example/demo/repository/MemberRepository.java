package com.example.demo.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.domain.Member;



public interface MemberRepository {
	
	public void addMember(Member member);
	public Member findByMember(Member member) throws Exception;
	public List<String> findIdAll();
}
