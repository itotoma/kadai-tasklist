class ToppagesController < ApplicationController
  def index
    if logged_in
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page]).per(10) #一覧表示用
    end
  end
end
