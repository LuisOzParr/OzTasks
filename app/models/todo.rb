class Todo < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  before_destroy :destroy_task
  # Relations
  belongs_to :user
  has_many :tasks




  private

  def destroy_task
    self.tasks.each {|task| task.destroy}
  end



end
