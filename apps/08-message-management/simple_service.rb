class SimpleService

  def initialize(opt = {})
    @queue = TorqueBox.fetch('/queues/manage')
  end

  def start
    #count
    # remove
    move
  end

  def count
    puts "Messages in the queue: #{@queue.count_messages}"

    publish
    publish

    puts "Messages in the queue: #{@queue.count_messages}"

    publish(:properties => {'price' => 1.2})
    publish(:properties => {'price' => 2.51})
    publish(:properties => {'price' => 4.82})

    puts "Messages in the queue: #{@queue.count_messages}"
    puts "Messages in the queue with price over 1.0: #{@queue.count_messages('price IS NOT NULL AND price > 1.0')}"
  end

  def remove
    publish(:properties => {'price' => 1.2})
    publish(:properties => {'price' => 2.51})
    publish(:properties => {'price' => 4.82})

    puts "Messages in the queue: #{@queue.count_messages}"

    puts "Removing messages..."
    count = @queue.remove_messages("price > 2.0")
    puts "Removed messages: #{count}"

    puts "Messages in the queue: #{@queue.count_messages}"
  end

  def move
    @dest_queue = TorqueBox::Messaging::Queue.start("/queues/destination", :durable => false)

    publish(:properties => {'price' => 1.2})
    publish(:properties => {'price' => 2.51})
    publish(:properties => {'price' => 4.82})

    puts "Messages in the queue: #{@queue.count_messages}"

    puts "Moving messages..."
    @queue.move_messages(@dest_queue.name, "price > 2.0")

    puts "Messages in the queue: #{@queue.count_messages}"
    puts "Messages in the destination queue: #{@dest_queue.count_messages}"
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
