class UsersController < ApplicationController
  def index
      @user = current_user
      @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
  end
  
  def update
  end
  
  def unsubscribe
  end
  
  def destroy
  end
end
