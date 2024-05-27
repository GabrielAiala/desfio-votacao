Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
class Rack::Attack
  self.throttle('api_ip', limit:6, period: 1.minutes) do |req|
    req.ip
  end
end