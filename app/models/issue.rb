class Issue < ApplicationRecord
    has_many :member_issues
    has_many :members, through: :member_issues

    scope :young, -> { where("members.age < ?", 27)}
end
