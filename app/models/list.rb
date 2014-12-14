class List < ActiveRecord::Base
    validates :name, presence: true
    has_many :tasks, dependent: :destroy

    def to_s
        return name
    end
end
