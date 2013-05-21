TorqueBox.configure do
#  service SimpleService

  queue '/queues/new_descriptor' do
    durable false
  end
end
