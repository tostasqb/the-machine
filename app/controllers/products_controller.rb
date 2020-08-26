class ProductsController < ApplicationController
  require "#{Rails.root}/lib/vending"

  def index
  end

  def submit
    change = Vending.call(params[:inserted_coins], params[:product_id])

    respond_to do |format|
      format.json { render json: { message: 'ok', change: change }, status: 200 }
    end
  end

  private

  def permitted_params
    params.permit(
      :inserted_coins,
      :product_id
    )
  end
end
