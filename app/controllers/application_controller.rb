class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "application"

  def main

  end

  def create_hall
    @addr = params[:addr]
    Store.create_store_with_addr(@addr)
  end
end
