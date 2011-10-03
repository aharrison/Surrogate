class UserController < ApplicationController
  # get
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  # post
  def post
    if session['admin'] == 'true' then
      session['admin'] = false
    elsif 
      @user = User.find_by_name(params[:name])
      if @user == nil then
        @status = "Invalid login!"
      elsif @user.encrypted_password == @user.encrypt(params[:password])
        session[:user_id] = @user.id
        session['admin'] = 'true'
        @status = "Logged in successfully!"
      else
        @status = "Invalid login!"
      end
    end
    render :action => "new"
  end
end
