require 'date'
require 'time'

class ShiftsController < ApplicationController
  def index

  end

  def new
    @shift = Shift.new
    @shifts = Shift.where(:user => User.where(:organisation => current_user.organisation))
  end

  def create

    @start_dt = Date.parse(params[:shift][:date]) + Time.parse(params[:shift][:start]).seconds_since_midnight.seconds
    @finish_dt = Date.parse(params[:shift][:date]) + Time.parse(params[:shift][:finish]).seconds_since_midnight.seconds
    @shift = Shift.create({ :user =>  User.find(params[:shift][:user]), :start => @start_dt, :finish => @finish_dt, :break_length => params[:shift][:break_length] })
    if @shift.valid?
      redirect_to new_shift_path
    else
      flash[:errors] = @shift.errors.full_messages
      redirect_to new_shift_path
    end
  end

  def destroy

  end

  def check_params
    params.require(:shift).permit(:user_id, :start, :finish, :break_length)
  end
end
