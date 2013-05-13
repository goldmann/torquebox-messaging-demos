class SimpleService

  def initialize(opts = {})
    @queue = TorqueBox.fetch('/queues/selector')
  end

  def start
    (1..10).each do |v|
      @queue.publish("Message with #{v}", :properties => { 'score' => v })
    end

    Thread.new { receive }
  end

  def receive
    while (message = @queue.receive(:selector => "score > 5")) do
      puts "Received: '#{message}'"
    end
  end

  def stop
  end
end
