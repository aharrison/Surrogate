class UserController < ApplicationController
  def new
    @user = User.find_by_name(params[:name])
    if @user.encrypted_password = @user.encrypt(params[:password])
      session[:user_id] = @user.id
      session[:super_sekret] = 'blah'
    end
  end

end
