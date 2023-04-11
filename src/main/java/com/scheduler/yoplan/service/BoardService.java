package com.scheduler.yoplan.service;

import com.scheduler.yoplan.IService.IBoardService;
import com.scheduler.yoplan.VO.BoardVO;
import com.scheduler.yoplan.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService implements IBoardService {
    @Autowired
    BoardMapper boardMapper;
    @Override
    // 커뮤니티 게시글 등록
    public int regBoard(BoardVO board) {
        int result = boardMapper.regBoard(board);

        return result;
    }
}
