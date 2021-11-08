class NewUserSeedsJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user.self_cares.build(label: "Drink Water", frequency: 'day', goal: 8)
    @user.save
  end
end