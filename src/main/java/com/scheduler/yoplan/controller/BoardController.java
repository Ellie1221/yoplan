package com.scheduler.yoplan.controller;

import com.scheduler.yoplan.IService.IBoardService;
import com.scheduler.yoplan.VO.BoardVO;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

@Controller
@Slf4j
public class BoardController {


    @Autowired
    IBoardService iBoardService;
    @GetMapping("/regBoard")
    public void regBoard(){}



    @GetMapping("/boardListView")
    public void boardListView(){
    }


    @PostMapping("/regBoard.do")
    public String regBoardDo(BoardVO board){
        iBoardService.regBoard(board);

        return "boardListView";
    }

}
