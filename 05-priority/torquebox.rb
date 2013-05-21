TorqueBox.configure do
  service SimpleService

  queue '/queues/priority' do
    durable false
  end
end
