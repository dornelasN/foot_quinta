class SessionsController < ApplicationController
  def new
  end

  def create
    # find user by email param
    user = User.find_by(email: params[:session][:email].downcase)

    # if user is true and the password matches its authentication
    if user && user.authenticate(params[:session][:password])
      # Log the usre in and redirectt o the user's show page
    else
      # Render login page with an error message
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
