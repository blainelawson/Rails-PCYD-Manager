class Director < ApplicationRecord
    belongs_to :chair, class_name: 'Member', foreign_key: :chair_id, optional: true

    validates :title, uniqueness: true
#     attr_accessor :chair

#     def chair=(member)
#         self.member = member
#     end

#     def chair
#         self.member
#     end
end
