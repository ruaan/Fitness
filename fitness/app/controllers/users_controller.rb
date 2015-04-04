class UsersController < ApplicationController

 def index
  end

  def show
    @users = User.where(:id => current_user.id)
  end

  def edit
  end

  def add
  end

  def delete
  end
end
