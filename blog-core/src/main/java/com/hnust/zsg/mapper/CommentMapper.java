package com.hnust.zsg.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hnust.zsg.entity.po.CommentPO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper  {
    Long getCommentAmountByArticleId(@Param("id") Long id);
    List<CommentPO> getAllCommentByArticleId(@Param("id") Long id);
}
