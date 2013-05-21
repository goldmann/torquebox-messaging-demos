class SimpleService

  def initialize(opt = {})
  end

  def start
    TorqueBox::ScheduledJob.schedule('SimpleJob', '*/2 * * * * ?')    
  end

  def stop
  end
end
