TorqueBox.configure do
  service SimpleService

  queue '/queues/synchronous' do
    durable false
  end
end
