module Task
  class Item < ApplicationRecord
    belongs_to :list

    enum status: { active: 0, archived: 1 }

    validates :title, presence: true, uniqueness: { scope: :list_id }
    validates :body, presence: true
    validates :due, presence: true, numericality: { greater_than: 0 }
  end
end
