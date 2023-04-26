package com.hnust.zsg.controller;

import com.hnust.zsg.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/comments")
@Slf4j
public class CommentController {
    /**
     * 用户给评论点赞功能
     * @return
     */
    @PostMapping("/like")
    public Result LikeComment(@RequestParam("userId")Long userId, @RequestParam("commentId")Long commentId){
        return null;
    }
}
