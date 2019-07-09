class MemberIssue < ApplicationRecord
    belongs_to :member
    belongs_to :issue
end
