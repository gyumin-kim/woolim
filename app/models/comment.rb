class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 1000 }
end
