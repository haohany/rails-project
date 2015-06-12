class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      # Log in and redirect to portal.
      log_in admin
      redirect_to root_path
    else
      # Show the error message.
      flash.now[:danger] = 'Incorrect username or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
