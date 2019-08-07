# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    d = params.permit!
    comment = Comment.create(d[:comment].merge(user: current_user))
    render json: comment
  end
end
