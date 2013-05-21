class SimpleService

  def initialize(opt = {})
  end

  def start
    # Run a job every 200 ms for over 5 seconds, from now
    # TorqueBox::ScheduledJob.at('SimpleJob', :every => 200, :until => Time.now + 5)
    
    # Start in 1 second, then every 200 ms for over 4 seconds
    # TorqueBox::ScheduledJob.at('SimpleJob', :at => Time.now + 5, :every => 200, :until => Time.now + 10)
    
    # Start in 1 second, then every 200 ms for over 4 seconds
    #TorqueBox::ScheduledJob.at('SimpleJob', :in => 5_000, :every => 200, :until => Time.now + 10)
    
    # Start in 1 second, then repeat te job 10 times, every 200 ms
    TorqueBox::ScheduledJob.at('SimpleJob', :in => 1_000, :repeat => 10, :every => 200)
  end

  def stop
  end
end
