class Task < ActiveRecord::Base
  belongs_to :list

  validates :name, :list, presence: true

  def to_s
      return name
  end
end
