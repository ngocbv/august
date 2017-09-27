require "spec_helper"

describe August::Logger do
  let(:stream) { double(:stream) }

  describe "#log" do
    it "proxies to stream" do
      logger = August::Logger.new(stream)
      expect(stream).to receive(:puts).with("Hello!")
      logger.log("Hello!")
    end
  end
end
