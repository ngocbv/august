require "august/version"
require "august/logger"

module August
  def self.logger
    @logger ||= August::Logger.new
  end
end
