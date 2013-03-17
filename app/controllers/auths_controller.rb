class AuthsController < ApplicationController
  skip_before_filter :authorize, only: [:login, :password]
  
  def password
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome"  
    else
      redirect_to login_url, abc: params[:password], :flash => { :password => params[:password] }
    end  
  end
  
  def login
    unless session[:user_id]
      if User.count == 0
        @nouser = "No Users Siggned Up, Kindly Contact Admin [ Create 1st User From Console ]"
      end
    @password = flash[:password]
    @type = "text"
    @type = "password" if @password
    else
      redirect_to root_url, notice: "You are Logged in"  
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_url, stat: "Logged Out"
  end
end