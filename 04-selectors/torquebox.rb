TorqueBox.configure do
  service SimpleService

  queue '/queues/selector' do
    durable false

    processor SimpleProcessor do
      selector "score < 5"
    end
  end
end
