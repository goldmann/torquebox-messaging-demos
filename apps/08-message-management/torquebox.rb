TorqueBox.configure do
  service SimpleService

  queue '/queues/manage' do
    durable false
  end
end
