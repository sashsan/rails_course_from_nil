class ItemsController < ApplicationController

  def index
    @items = Item.all

    render body: @items.map { |i| "#{i.name}: #{i.price}" }
  end
end