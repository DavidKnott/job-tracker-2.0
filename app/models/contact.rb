class Contact < ActiveRecord::Base
  validates :full_name, presence: true
  belongs_to :company
end