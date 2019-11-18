class Admin::SpecialdealsController < ApplicationController
  before_action :authenticate_user!

  def new
    @specialdeal = Specialdeal.new
  end

  def create
    @specialdeal = current_user.specialdeals.create(specialdeal_params)
    redirect_to admin_specialdeal_path(@specialdeal)
  end

  def show
    @specialdeal = Specialdeal.find(params[:id])
  end

  private

  def specialdeal_params
    params.require(:specialdeal).permit(:title, :cost, :description, :disclaimer)
  end
end
