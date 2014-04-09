class SessionsController < ApplicationController
  def login
  end
  
  def create_session
    @user = User.find_by email: params[:email]
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to blog_posts_path
    else
      redirect_to login_path
    end
  end
  
  def signup
  end
  
  def destroy_session
    session[:user_id] = nil
    redirect_to root_path
  end
end