class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
    # already set in before_action
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

  def update
    if @user.update(strong_parameters)
      flash[:notice] = "#{@user.username}, your record has been updated."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def strong_parameters 
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
