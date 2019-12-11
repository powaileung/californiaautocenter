class ChargesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.charges.create(specialdeal: current_specialdeal)

  # Amount in cents
    @amount = current_specialdeal.cost

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

  redirect_to specialdeal_path(current_specialdeal)  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path

  end

  private

  def current_specialdeal
    @current_specialdeal ||= Specialdeal.find(params[:specialdeal_id])
  end
end
