TorqueBox.configure do
  service SimpleService

  queue '/queues/messages' do
    durable false
  end
end
