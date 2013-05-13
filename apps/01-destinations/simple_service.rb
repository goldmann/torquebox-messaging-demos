class SimpleService

  def initialize(opt = {})
    # Create the '/queues/new' queue
    #@queue = TorqueBox::Messaging::Queue.start('/queues/new', :durable => false)
  end

  def start
  end

  def stop
  end
end
