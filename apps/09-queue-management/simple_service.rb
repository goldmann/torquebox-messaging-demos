class SimpleService

  def initialize(opt = {})
    @queue = TorqueBox::Messaging::Queue.start("/queues/manage", :durable => false)
  end

  def start
    #pause
    list
  end

  def pause
    Thread.new { receive }

    publish

    puts "Current status: paused? #{@queue.paused?}"
    puts "Pausing the queue..."
    @queue.pause
    puts "Current status: paused? #{@queue.paused?}"
  
    publish
    publish
    publish

    puts "Sleeping for 10 seconds..."
    sleep 10

    puts "Resuming the queue..."
    @queue.resume
    puts "Current status: paused? #{@queue.paused?}"
  end

  def list
    queues = TorqueBox::Messaging::Queue.list

    puts "Deployed queues: #{queues.size}"
    puts "Deployed queues: #{queues.map {|q| q.name}}"

    TorqueBox::Messaging::Queue.start("/queues/new", :durable => false)

    queues = TorqueBox::Messaging::Queue.list

    puts "Deployed queues: #{queues.size}"
    puts "Deployed queues: #{queues.map {|q| q.name}}"
  end

  def publish(options = {})
    options = options.merge( :payload => "Hello!" )
    puts "Sending a message to the queue..."
    @queue.publish(options[:payload], :properties => options[:properties])
  end

  def receive
    while (msg = @queue.receive(:timeout => 30_000)) do
      puts "Received: '#{msg}'"
    end
  end


  def stop
  end
end
