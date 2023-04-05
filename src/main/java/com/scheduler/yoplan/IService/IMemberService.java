package com.scheduler.yoplan.IService;

import com.scheduler.yoplan.VO.MemberVO;

public interface IMemberService {
    //로그인 확인
    public int loginCheck(String id, String pw);

    //로그인 정보 세션에 저장
    public MemberVO loginInfo(String id);

    //회원가입시 아이디 확인
    public int idCheck(String id);

    //닉네임 중복체크
    public int nicknameCheck(String nickname);
}
