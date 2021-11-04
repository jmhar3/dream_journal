class CreateCompletedCareJob < ApplicationJob
  queue_as :default

  def perform(self_care)
    self_care.completed_cares.build
  end
end