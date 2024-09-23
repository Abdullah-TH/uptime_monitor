class MonitorJob < ApplicationJob
  queue_as :default

  def perform(domain)
    return if domain.monitoring == false
    domain.ping
    MonitorJob.set(wait_until: 2.seconds.from_now).perform_later(domain)
  end
end
