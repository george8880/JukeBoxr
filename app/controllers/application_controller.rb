class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "application"

  def main

  end

  def create_hall
    Store.create_store_with_addr(params[:addr], params[:name])
  end
end
