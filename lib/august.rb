require "august/version"
require "august/logger"
require "august/cli"

module August
  def self.logger
    @logger ||= August::Logger.new
  end
end
