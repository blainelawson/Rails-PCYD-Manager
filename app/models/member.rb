class Member < ApplicationRecord
    has_secure_password
    has_many :member_issues
    has_many :issues, through: :member_issues
    has_many :committee_members
    has_many :committees, through: :committee_members
end
