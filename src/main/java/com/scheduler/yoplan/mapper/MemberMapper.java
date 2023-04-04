package com.scheduler.yoplan.mapper;

import com.scheduler.yoplan.VO.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    //로그인 확인
   public int loginCheck(String id, String pw);

   //로그인정보 받아오기
   public MemberVO loginInfo(String id);
}
