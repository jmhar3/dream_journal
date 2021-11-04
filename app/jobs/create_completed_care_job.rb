class CreateCompletedCareJob < ApplicationJob
  queue_as :default

  def perform(id)
    # cc = CompletedCare.new(self_care_id: id, tally: 0)
    # cc.save
  end
end