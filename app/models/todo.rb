class Todo < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  before_destroy :destroy_task
  # Relations
  has_many :tasks
  belongs_to :user

  private
  def destroy_task
    self.tasks.each {|task| task.destroy}
  end

end
