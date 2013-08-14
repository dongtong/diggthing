#-*- coding: utf-8 -*-
class CommentsController < ApplicationController
  def create
  	@cartoon = Cartoon.find(params[:comment][:cartoon_id])
  	comment = @cartoon.comments.build(params[:comment])
  	if comment.save
  		render json: {state: :success, msg: {username: current_user.username, content: comment.content}}
  	else
  		render json: {state: :failed, msg: "添加评论失败,评论内容不能为空!"}
  	end
  end
end
