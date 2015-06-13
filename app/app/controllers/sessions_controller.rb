class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id

    respond_to do |format|
      format.html
        if @user.valid?
          redirect_to new_rant_path
          return
        end
      redirect_to root_path
    end

  end

  def destroy
    reset_session
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
