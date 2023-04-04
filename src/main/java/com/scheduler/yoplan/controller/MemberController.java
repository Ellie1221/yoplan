package com.scheduler.yoplan.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MemberController {

    @GetMapping("/loginForm")
    public void loginForm(){
    }

    @PostMapping("/login")
    public void doLogin(String id, String pw){
        //작성중
    }

}
