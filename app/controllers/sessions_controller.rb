class SessionsController < DeviseController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
      if user.save
        session[:user_id] = user.id
        redirect_to recipes_path, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        redirect_to recipes_path
      end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_path, :notice => "Logged out!"
  end

end
