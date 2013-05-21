TorqueBox.configure do
  # Service definition
  service SimpleService

  queue '/queues/processor' do
    # We do not want to persist the queue
    # and its content across TorqueBox
    # restarts
    durable false

    # Message processor definition
    # attached to the /queues/processor queue
    processor SimpleProcessor
  end
end
