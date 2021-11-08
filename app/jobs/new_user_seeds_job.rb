class NewUserSeedsJob < ApplicationJob
  queue_as :priority

  def perform(user)
    user.self_cares << SelfCare.create(label: "Drink Water", frequency: 'day', goal: 8)
  end
end