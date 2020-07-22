class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_parameters)

    if @user.save
      flash[:notice] = "Congratulations, #{@user.username}, you are now signed up for Alpha Blog!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def strong_parameters 
    params.require(:user).permit(:username, :email, :password)
  end

end
