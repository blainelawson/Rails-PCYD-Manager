class Member < ApplicationRecord
    has_secure_password
    has_many :member_issues
    has_many :issues, through: :member_issues
    has_many :committee_members
    has_many :committees, through: :committee_members
    belongs_to :committee, optional: true

    accepts_nested_attributes_for :member_issues
    accepts_nested_attributes_for :issues, reject_if: proc { 
        |attributes| attributes['key_word'].blank? || Issue.exists?(attributes['key_word'])}

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :name, presence: true
    validates :dob, presence: true
    validates :issues, length: { maximum: 5 }

    attr_accessor :month, :day, :year

    scope :young, -> { where("dob > ?", 22.years.ago) }
    scope :old, -> { where("dob < ?", 22.years.ago)}

    def self.most_active_members
        self.joins(:committee_members).group(:id).order('COUNT(members.id) DESC').limit(3)
    end

    def self.young_issues
        young.collect do |member|
            member.issues.collect do |issue|
                issue
            end
        end.flatten.uniq
    end

    def self.old_issues
        old.collect do |member|
            member.issues.collect do |issue|
                issue
            end
        end.flatten.uniq
    end

    def self.from_omniauth(auth)
          where(email: auth.info.email).first_or_initialize do |user|
          user.user_name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end

    # Member and find the one with highest member.committees.length

    
end
