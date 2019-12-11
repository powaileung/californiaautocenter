class Admin::SpecialdealsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

    if @specialdeal.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @specialdeal = Specialdeal.find(params[:id])
    if @specialdeal.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @specialdeal.update_attributes(specialdeal_params)
    redirect_to root_path
  end

  def destroy
    @specialdeal = Specialdeal.find(params[:id])
    if @specialdeal.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    
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
