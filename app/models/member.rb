class Member < ApplicationRecord
    has_secure_password
    has_many :member_issues
    has_many :issues, through: :member_issues
    has_many :committee_members
    has_many :committees, through: :committee_members
    belongs_to :committee, optional: true

    accepts_nested_attributes_for :member_issues
    accepts_nested_attributes_for :issues

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :name, presence: true
    validates :dob, presence: true
    # validates :issues, length: { maximum: 5 }

    attr_accessor :month, :day, :year

    # def issues_attributes=(issues_attributes)
    #     issues_attributes.values.each do |issue_attribute|
    #         if !issue_attribute.values.join.empty? 
    #             issue = Issue.find_or_create_by(issue_attribute)
    #             self.issues << issue
    #         end
    #     end
    # end
    
end
