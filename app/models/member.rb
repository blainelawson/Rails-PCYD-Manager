class Member < ApplicationRecord
    has_secure_password
    has_many :member_issues
    has_many :issues, through: :member_issues
    has_many :committee_members
    has_many :committees, through: :committee_members
    belongs_to :committee, optional: true

    accepts_nested_attributes_for :member_issues

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :name, presence: true
    validates :dob, presence: true

    attr_accessor :month, :day, :year

end
