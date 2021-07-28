class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
  end

  def show
  	@order = Order.find_by(id: params[:id])
  end

  def new
  	@order = current_user.orders.new()
  end

  def create
  	@order = current_user.orders.new(order_params)
  	respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'New order placed.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def order_params
  	params.compact_blank!.require(:order).permit(:weight, :status, :payment_option, :charge, :service_type, sender: user_details_fields, receiver: user_details_fields)
  end

  def user_details_fields
  	[:full_name, :address, :mobile, :pin, :email]
  end
end
