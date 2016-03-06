class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.password == params[:password]
      render json: user
    elsif user
      render :json => { :errors => "Entered password is incorrect" }, :status => 422
    else
      render :json => { :errors => "Email address is not avilable in the system"}, :status => 422 
    end
  end
end
