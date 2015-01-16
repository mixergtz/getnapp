class HotelsController < ApplicationController
  def index
    @search = params[:q]
  end
end
