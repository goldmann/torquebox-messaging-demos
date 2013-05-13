class SimpleService

  def initialize(opt = {})
    @queue = TorqueBox.fetch('/queues/synchronous')
  end

  def start
    Thread.new { publish }

    @queue.receive_and_publish do |message|
      puts "Received a message, converting it..."
      message.upcase + " at GeeCon!"
    end

  end

  def publish
    puts "Publishing a message..."

    message = @queue.publish_and_receive("marek")

    puts "Received back a message: '#{message}'"
  end

  def stop
  end
end
