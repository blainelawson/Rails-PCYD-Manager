class Committee < ApplicationRecord
    has_many :committee_members
    has_many :members, through: :committee_members
    belongs_to :chair, class_name: 'Member', foreign_key: :chair_id, optional: true

    validates :name, uniqueness: true

    def self.chairs
        self.all.collect do |committee|
            committee.chair
        end
    end
end
