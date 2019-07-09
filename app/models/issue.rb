class Issue < ApplicationRecord
    has_many :member_issues
    has_many :members, through: :member_issues
end
