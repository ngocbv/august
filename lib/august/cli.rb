require "slop"

module August
  class CLI
    BANNER = "usage: august [options] [./config.ru]".freeze

    def parse(items = ARGV)
      config = Slop.parse(items) do |options|
        options.banner = BANNER

        options.on '-h', '--help', 'help' do
          return help(options)
        end

        options.on '-v', '--version', 'version' do
          return version
        end
      end

        options.string '-b', '--bind', 'bind (default: 0.0.0.0)', default: '0.0.0.0'
        options.integer '-p', '--port', 'port (default: 8888)', default: 8888
        options.integer '--backlog', 'backlog (default: 64)', default: 64
        options.boolean '--reuseaddr', 'reuseaddr (default: true)', default: true

      run(config)
    end

    private
    def help(options)
      August.logger.log("#{options}")
    end

    def version
      August.logger.log(VERSION)
    end

    def run(options)
      config, = options.arguments
      Launcher.new(options[:port], options[:bind], options[:resueaddr], options[:backlog], config || "./config.ru").run
    end
  end
end
