class CreateCompletedCareJob < ApplicationJob
  queue_as :default

  def perform(sc)
    CompletedCare.create(self_cares_id: sc.id, tally: 0, user_id: sc.user_id)
  end
end