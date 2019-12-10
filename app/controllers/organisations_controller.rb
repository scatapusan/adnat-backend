class OrganisationsController < ApplicationController
  def index
    if not user_signed_in?
      redirect_to user_session_path
    end
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.create(check_params)
    if @organisation.valid?
      redirect_to organisations_path
    else
      flash[:errors] = @organisation.errors.full_messages
      redirect_to organisations_new_path
    end
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(check_params)
    redirect_to organisations_path
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    redirect_to organisations_path
  end

  def check_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end
