class SessionsController < ApplicationController
    def new
        # render login page
    end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else 
      flash[:errors] = ["Invalid Authentication"]
      redirect_to new_session_path
    end
  end

    def destroy
        # Log User out
        session[:user_id] = nil
        redirect_to new_session_path
    end

end
