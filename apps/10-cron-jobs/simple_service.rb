class SimpleService

  def initialize(opt = {})
  end

  def start
    TorqueBox::ScheduledJob.schedule('SimpleJob', '*/10 * * * * ?')    
  end

  def stop
  end
end
