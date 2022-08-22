package com.atguigu.qqzone.controller;

import com.atguigu.qqzone.pojo.HostReply;
import com.atguigu.qqzone.pojo.Reply;
import com.atguigu.qqzone.pojo.UserBasic;
import com.atguigu.qqzone.service.HostReplyService;

import javax.servlet.http.HttpSession;
import java.util.Date;

public class HostReplyController {

    private HostReplyService hostReplyService ;

    public String addHostReply(String content ,Integer replyId ,Integer topicId, HttpSession session){
        UserBasic author = (UserBasic)session.getAttribute("userBasic");
        HostReply hostReply = new HostReply(content , new Date() , author , new Reply(replyId));
        hostReplyService.addHostReply(hostReply);
        return "redirect:topic.do?operate=topicDetail&id="+topicId;
    }

    public String delHostReply(Integer HostReplyId , Integer topicId){
        hostReplyService.delHostReply(HostReplyId);
        return "redirect:topic.do?operate=topicDetail&id="+topicId;
    }
}
