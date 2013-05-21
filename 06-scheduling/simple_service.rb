class SimpleService

  def initialize(opt = {})
    @queue = TorqueBox.fetch('/queues/schedule')
  end

  def start
    puts "Publishing messages..."

    @queue.publish("Normal")

    # 10 seconds later
    @queue.publish("Scheduled", :scheduled => Time.now + 10)

    while (msg = @queue.receive(:timeout => 20_000)) do
      break if msg.nil?

      puts "Received: '#{msg}'"
    end
  end

  def stop
  end
end
