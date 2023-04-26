package com.hnust.zsg.entity.po;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Timestamp;

@TableName("comment")
@AllArgsConstructor
@Data
public class CommentPO {
    @TableId("id")
    private Long id;

    @TableField("articleId")
    private Long articleId;

    @TableField("userId")
    private Long userId;

    @TableField("createTime")
    private Timestamp createTime;

    @TableField("commentLikes")
    private Long commentLikes;

    @TableField("state")
    private Boolean state;


}
