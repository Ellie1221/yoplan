package com.scheduler.yoplan.mapper;

import com.scheduler.yoplan.VO.BoardVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {


    // 커뮤니티 게시글 등록
    public int regBoard(BoardVO board);

}
