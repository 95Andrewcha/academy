package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int level;
    private int comment_no;
    private int parent_no;
    private int board_no;
    private String comment_writer;
    private String content;
    private Date reg_date;
    
}
