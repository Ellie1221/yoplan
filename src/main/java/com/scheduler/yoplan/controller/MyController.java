package com.scheduler.yoplan.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@Slf4j
public class MyController {

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("/header")
    public void header(){
    }


}
