class SimpleService

  def initialize(opt = {})
    @queue = TorqueBox.fetch('/queues/priority')
  end

  def start
    puts "Publishing messages"

    # Publish 4 messages with different priorities
    @queue.publish("Normal")
    @queue.publish("Low", :priority => :low)
    @queue.publish("Critical", :priority => :critical)
    @queue.publish("High", :priority => :high)

    puts "Receiving messages"

    while (msg = @queue.receive(:timeout => 1_000)) do
      break if msg.nil?

      puts msg
    end
  end

  def stop
  end
end
