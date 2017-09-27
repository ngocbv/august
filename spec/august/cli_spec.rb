require 'spec_helper'

describe August::CLI do
  let(:cli) { August::CLI.new() }
  let(:launcher) { double(:launcher) }

  describe "#parse" do
    %w(-v --version).each do |option|
      it "supports '#{option}' option" do
        expect(August.logger).to receive(:log).with August::VERSION
        cli.parse([option])
      end
    end

    it "builds a launcher and executes run" do
      expect(August::Launcher).to receive(:new).with(4000, "0.0.0.0", true, 16, "./config.ru") { launcher }
      expect(launcher).to receive(:run)
      cli.parse(["--port", "4000", "--bind", "0.0.0.0", "--backlog", "16"])
    end
  end
end
