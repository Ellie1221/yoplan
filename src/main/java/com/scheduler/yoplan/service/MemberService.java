package com.scheduler.yoplan.service;

import com.scheduler.yoplan.IService.IMemberService;
import com.scheduler.yoplan.VO.MemberVO;
import com.scheduler.yoplan.mapper.MemberMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements IMemberService {

    @Autowired
    MemberMapper mMapper;

    @Override
    //로그인확인
    public int loginCheck(String id, String pw) {
           return mMapper.loginCheck(id, pw);
    }
    @Override
    //세션에 로그인 정보 저장
    public MemberVO loginInfo(String id) {
        return mMapper.loginInfo(id);
    }
}
