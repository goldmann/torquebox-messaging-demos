class SimpleProcessor < TorqueBox::Messaging::MessageProcessor

  def on_message(body)
    puts "Received '#{body}'"
  end

end
