class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome."
        redirect_to "/places"
      else
        flash["notice"] = "Invalid Login."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Invlaid Login."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Safe Travels :)"
    redirect_to "/login"
  end
end

  