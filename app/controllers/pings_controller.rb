require 'net/http'

class PingsController < ApplicationController
  def create
    @domain = Domain.find(params[:domain_id])
    http = Net::HTTP.new(@domain.name, 80)
    start_time = Time.now
    response = http.request(Net::HTTP::Get.new("/"))
    response_time = (Time.now - start_time) * 1000
    @ping = @domain.pings.create(response_time: response_time, alive: true)
  rescue StandardError => e
    @domain.pings.create(alive: false)
  end
end
