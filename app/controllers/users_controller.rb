class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
    if params[:organisation]
      @user.update(organisation: Organisation.find(params[:organisation]))
    else
      @user.update(organisation: nil)
      Shift.where(:user => @user).delete_all
    end
    redirect_to organisations_path

  end

  def show

  end

end
