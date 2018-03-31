class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[user][username], params[user][password])
    if @user
      login(@user)
      render '/api/users/show'
    else
      render ["Invalid User Credentials"], status: 418
    end
  end

  def destroy
    if current_user
      logout!
      render json: {}
    else
      render ["Not Logged In"], status: 404
    end
  end
end
