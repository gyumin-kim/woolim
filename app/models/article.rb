class Article < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy
    # has_many :comments
    
    validates :user_id, presence: true
    validates :title, presence: true, length: { minimum: 2, maximum: 50 }
    validates :author, presence: true
    validates :publisher, presence: true
    validates :page, presence: true
    validates :line, presence: true, length: { minimum: 3, maximum: 300 }
    validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
end