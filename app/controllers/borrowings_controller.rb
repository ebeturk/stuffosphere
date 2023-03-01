class BorrowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def new
    @borrowing = @item.borrowings.new
  end

  def create
    @borrowing = @item.borrowings.new(borrowing_params)
    @borrowing.user = current_user
    @borrowing.item = @item
    if @borrowing.save
      redirect_to @item, notice: 'Borrowing was successfully created.'
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def borrowing_params
    params.require(:borrowing).permit(:start_time, :end_time)
  end
end
