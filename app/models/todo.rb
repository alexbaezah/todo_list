class Todo < ApplicationRecord

    scope :sorted, lambda{order(id: :asc)}

    scope :done, lambda{where(completed: :true)}

    scope :undone, lambda{where(completed: :false)}

    validates :description, presence: true
end
