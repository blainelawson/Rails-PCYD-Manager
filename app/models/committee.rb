class Committee < ApplicationRecord
    has_many :committee_members
    has_many :members, through: :committee_members
    belongs_to :chair, class_name: 'Member', foreign_key: :chair_id, optional: true
end
