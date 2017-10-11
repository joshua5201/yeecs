class MemberCategory < ApplicationRecord
  has_many :members
  validates_uniqueness_of :url
  validates_presence_of :url
end
