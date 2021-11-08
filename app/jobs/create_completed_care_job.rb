class CreateCompletedCareJob < ApplicationJob
  queue_as :default

  def perform(sc)
    cc = CompletedCare.new(self_cares_id: sc.id, user_id: sc.user_id)
    sc.user.completed_cares << cc.save
    raise cc.inspect
  end
end