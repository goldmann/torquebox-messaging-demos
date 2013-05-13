class SimpleService

  def initialize(opts = {})
    @queue = TorqueBox.fetch('/queues/processor')
  end

  def start
    (1..10).each do |v|
      @queue.publish("Message with #{v}")
    end
  end

  def stop
  end
end
