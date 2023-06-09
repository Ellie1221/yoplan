package com.scheduler.yoplan.controller;

import com.scheduler.yoplan.IService.IMemberService;
import com.scheduler.yoplan.VO.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Objects;

@Controller
@Slf4j
public class ControllerOfChaeng {

    @Autowired
    IMemberService mService;

    //로그인폼으로 이동
    @RequestMapping(value = "/loginForm", method = RequestMethod.GET)
    public void loginForm() {
    }

    //로그인확인
    @RequestMapping(value = "/member", method = RequestMethod.POST)
    public String doLogin(String id, String pw, HttpSession session, Model model) {
        String loginMsg = "";
        if (id.equals("")) {
            loginMsg = "아이디를 입력해주세요";
            model.addAttribute("loginMsg", loginMsg);
            return "loginForm";
        } else if (pw.equals("")) {
            loginMsg = "비밀번호를 입력해주세요";
            model.addAttribute("loginMsg", loginMsg);
            return "loginForm";
        } else {
            int loginResult = mService.loginCheck(id, pw);
            if (loginResult == 1) {

                MemberVO member = mService.loginInfo(id);
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
                model.addAttribute("loginMsg", loginMsg);
                return "index";
            } else {
                loginMsg = "잘못된 로그인 정보입니다";
                model.addAttribute("loginMsg", loginMsg);
                return "loginForm";
            }
        }

    }

    //로그아웃
    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("loginMsg", "로그아웃되었습니다");
        return "index";
    }

    //회원가입 폼으로 이동
    @RequestMapping(value = "/newMember", method = RequestMethod.GET)
    public String regiMember() {
        return "regiMemForm";
    }

    //아이디 중복체크
    @RequestMapping(value = "/identification/id/{id}", method = RequestMethod.GET)
    @ResponseBody
    public int idCheck(@PathVariable String id) {
        return mService.idCheck(id);
    }

    //닉네임 중복체크
    @RequestMapping(value = "/nickname/nickname/{nickname}", method = RequestMethod.GET)
    @ResponseBody
    public int nicknameCheck(@PathVariable String nickname) {
        return mService.nicknameCheck(nickname);
    }

    //회원가입
    @RequestMapping(value = "/newMember", method = RequestMethod.POST)
    public String regiMember(MemberVO member, @RequestParam("profileName") MultipartFile file, HttpServletRequest request, HttpSession session) {
        member.setCategory(" ");
        member.setStatus("on");
        member.setReason(" ");
        log.info(member.toString());
        if(file.isEmpty()){
            member.setProfile("basicProfile.png");
            mService.regiMember(member);
        }else{
            // 사진을 저장하기
            String path = System.getProperty("user.dir") + "/src/main/resources/static/images";
            log.info("path : " + path);
            member.setProfile(file.getOriginalFilename());
            File saveFile = new File(path, file.getOriginalFilename());
            log.info("saveFile : " + saveFile.toString());
            log.info("1-----");
            log.info(file.getName());

            try {
                log.info("2-----");
                file.transferTo(saveFile);
                log.info("3-----");
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
            log.info("4-----");
            log.info("5-----");
            mService.regiMember(member);
        }
        log.info("6-----");
        return "redirect:/preference";
    }
    @RequestMapping(value = "/preference", method = RequestMethod.GET)
    public void preference(){

    }
    //이메일인증
    @RequestMapping(value = "/emailConfirm/email/{email}", method = RequestMethod.POST)
    @ResponseBody
    public String emailConfirm(@PathVariable String email) throws Exception {
        return  mService.sendSimpleMessage(email);
    }


}
