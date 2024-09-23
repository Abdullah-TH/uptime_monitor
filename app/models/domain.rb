require "net/http"

class Domain < ApplicationRecord
  has_many :pings, dependent: :destroy
  validates :name, format: { with: /[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}/ }, uniqueness: true

  def ping
    http = Net::HTTP.new(name, 80)
    start_time = Time.now
    response = http.request(Net::HTTP::Get.new("/"))
    response_time = (Time.now - start_time) * 1000
    pings.create(response_time: response_time, alive: true)
  rescue StandardError => e
    pings.create(alive: false)
  end
end
