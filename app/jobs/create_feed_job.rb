class CreateFeedJob < ActiveJob::Base
  queue_as :default

  def perform(id)
    income = Income.find(id)
    feed = income.build_feed(company_id: income.company_id, created_by: income.created_by, date: income.date)
    feed.save
  end
end