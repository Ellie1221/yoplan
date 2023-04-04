package com.scheduler.yoplan.controller;

import com.scheduler.yoplan.IService.IMemberService;
import com.scheduler.yoplan.VO.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class MemberController {

    @Autowired
    IMemberService mService;

    @GetMapping("/loginForm")
    public void loginForm() {
    }

    @PostMapping("/login")
    public String doLogin(String id, String pw, HttpSession session, Model model) {
        int loginResult = mService.loginCheck(id, pw);
        String loginMsg = "";
        log.info("-========1========");
        if (loginResult == 1) {

            MemberVO member = mService.loginInfo(id);
            log.info(member.toString());
            if (member.getStatus().equals("off")) {
                loginMsg = "탈퇴한 회원입니다";
            } else {
                loginMsg = "로그인에 성공하였습니다";
                session.setAttribute("logId", member.getId());
                session.setAttribute("logPw", member.getId());
                session.setAttribute("logName", member.getId());
                session.setAttribute("logTel", member.getId());
                session.setAttribute("logEmail", member.getId());
                session.setAttribute("logNickname", member.getId());
                session.setAttribute("logProfile", member.getId());
                session.setAttribute("logCategory", member.getId());
                session.setAttribute("logStatus", member.getId());
            }
            model.addAttribute("loginMsg",loginMsg);
            return "index";
        } else {
            loginMsg = "잘못된 로그인 정보입니다";
            model.addAttribute("loginMsg",loginMsg);
            return "loginForm";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model){
        session.invalidate();
        model.addAttribute("loginMsg","로그아웃되었습니다");
        return "index";
    }


}
