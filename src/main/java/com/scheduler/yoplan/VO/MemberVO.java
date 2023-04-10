package com.scheduler.yoplan.VO;

import lombok.Data;

@Data
public class MemberVO {
    private String id;
    private String pw;
    private String name;
    private String tel;
    private String email;
    private String nickname;
    private String profile;
    private String category;
    private String status;
    private String reason;
}
