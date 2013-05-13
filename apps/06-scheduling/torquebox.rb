TorqueBox.configure do
  service SimpleService

  queue '/queues/schedule' do
    durable false
  end
end
