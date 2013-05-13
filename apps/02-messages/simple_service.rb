class SimpleService

  def initialize(opt = {})
    @queue = TorqueBox.fetch('/queues/messages')
  end

  def start
    @queue.publish("Test")
    @queue.publish(:this => "is", :a => "Ruby", :hash => true)

    while (message = @queue.receive(:timeout => 5_000)) do
      if (message.is_a?(Hash))
        puts "Received hash"
        puts "Keys: #{message.keys}"
      else
        puts "Received text"
        puts "Received: '#{message}'"
      end
    end
  end

  def stop
  end
end
