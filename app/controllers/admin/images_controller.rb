class ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @specialdeal = Specialdeal.find(params[:specialdeal_id])
    @specialdeal.images.create(image_params)
    redirect_to admin_specialdeal_path(@specialdeal)
  end

  private

  def image_params
    params.require(:image).permit(:picture, :caption)
  end 

end