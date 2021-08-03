# frozen_string_literal: true

module Task
  class List < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :items

    enum status: { active: 0, archived: 1 }
  end
end
