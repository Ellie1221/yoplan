package com.scheduler.yoplan.IService;

import com.scheduler.yoplan.VO.MemberVO;

public interface IMemberService {
    //로그인 확인
    public int loginCheck(String id, String pw);

    //로그인 정보 세션에 저장
    public MemberVO loginInfo(String id);
}
