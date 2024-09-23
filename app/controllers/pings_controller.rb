class PingsController < ApplicationController
  def create
    @domain = Domain.find(params[:domain_id])
    @ping = @domain.ping
  end
end
