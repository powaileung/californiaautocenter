class SpecialdealsController < ApplicationController
  def index
    @specialdeals = Specialdeal.all
  end

  def show
    @specialdeal = Specialdeal.find(params[:id])
  end
end
