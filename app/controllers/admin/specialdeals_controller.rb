class Admin::SpecialdealsController < ApplicationController
  before_action :authenticate_user!

  def new
    @specialdeal = Specialdeal.new
  end

  def create
    @specialdeal = current_user.specialdeals.create(specialdeal_params)
    if @specialdeal.valid?
      redirect_to admin_specialdeal_path(@specialdeal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @specialdeal = Specialdeal.find(params[:id])
  end

  def edit
    @specialdeal = Specialdeal.find(params[:id])
  end

  def update
    @specialdeal = Specialdeal.find(params[:id])
    @specialdeal.update_attributes(specialdeal_params)
    redirect_to root_path
  end

  def destroy
    @specialdeal = Specialdeal.find(params[:id])
    @specialdeal.destroy
    redirect_to root_path
  end

  private

  helper_method :current_specialdeal
  def current_specialdeal
    @current_specialdeal ||= Specialdeal.find(params[:id])
  end

  def specialdeal_params
    params.require(:specialdeal).permit(:title, :cost, :description, :disclaimer)
  end
end
