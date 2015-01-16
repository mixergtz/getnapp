class HotelsController < ApplicationController
  def index
    @search = params[:q]
  end

  def show
  end
end
