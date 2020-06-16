class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_item, only: %i[show edit update destroy upvote]
  before_action :admin?,    only: %i[edit]
  after_action  :show_info, only: %i[index]

  def index
    @items = Item.all.order :id
    @items = @items.includes(:image)
  end

  def create
    @item = Item.create(items_params)

    if @item.persisted?
      flash[:success] = 'Item was saved'
      redirect_to items_path
    else
      flash.now[:error] = 'Please fill all fields correctly'
      render :new
    end
  end

  def new
    @item = Item.new
  end

  # def show; end
  #
  # def edit; end

  def update
    if @item.update(items_params)
      flash[:success] = 'Item was updated'
      redirect_to item_path
    else
      flash.now[:error] = 'Please fill all fields correctly'
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy.destroyed?
      flash[:success] = 'Item was deleted'
      redirect_to items_path
    else
      flash[:error] = "Item wasn't deleted"
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def upvote
    @item.increment! :votes_count
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 50')
    render :index
  end

  private

  def items_params
    params.require(:item).permit(:name, :price, :description)
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def show_info
    puts 'Index endpoint'
  end
end