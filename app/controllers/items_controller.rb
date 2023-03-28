class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.where(status: "available")

    if params[:query].present? || params[:category].present? || (params[:start_date].present? && params[:end_date].present?)
      if params[:query].present?
        @items = @items.where("name ILIKE ?", "%#{params[:query]}%")
      end

      if params[:category].present?
        @items = @items.where(category: params[:category])
      end

      if params[:start_date].present? && params[:end_date].present?
        start_time = DateTime.parse(params[:start_date])
        end_time = DateTime.parse(params[:end_date])
        @items = @items.select { |item| item.available?(start_time, end_time) }
      end
    end
  end

  def show
    @borrowing = Borrowing.new
  end

  def available?(start_time, end_time)
    borrowings.where("(start_time <= ? AND end_time >= ?) OR (start_time <= ? AND end_time >= ?) OR (start_time >= ? AND end_time <= ?)", start_time, start_time, end_time, end_time, start_time, end_time).empty?
  end

  def new
    @item = Item.new
  end

  def dashboard
    @items = Item.where(user: current_user)
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
    redirect_to @item, notice: 'Your listing is successfully updated.'
    else
    render :edit, notice: 'There was a problem with updating your listing.'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Your listing is successfully deleted."
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :status, :notes, :user_id, :photo)
  end
end
