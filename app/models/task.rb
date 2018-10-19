class Task < ApplicationRecord
  validates :title, presence: true
  before_create :start_status
  ## Todo validate if todo_id belongs to tu current user

  belongs_to :todo

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |task|
        csv << task.attributes.values_at(*column_names)
      end
    end
  end

  private
  def start_status
    self.status = false
  end
end
