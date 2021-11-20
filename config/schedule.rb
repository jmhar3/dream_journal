set :output, "/path/to/my/cron_log.log"

every :day do
    SelfCare.daily.each do |sc|
        runner "CreateCompletedCareJob.perform(#{sc})"
    end
end

every :monday
    SelfCare.weekly.each do |sc|
        runner "CreateCompletedCareJob.perform(#{sc})"
    end
end

every :month
    SelfCare.monthly.each do |sc|
        runner "CreateCompletedCareJob.perform(#{sc})"
    end
end