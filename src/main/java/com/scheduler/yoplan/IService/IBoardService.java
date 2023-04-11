package com.scheduler.yoplan.IService;

import com.scheduler.yoplan.VO.BoardVO;

public interface IBoardService {

    // 커뮤니티 게시글 등록
    public int regBoard(BoardVO board);
}
