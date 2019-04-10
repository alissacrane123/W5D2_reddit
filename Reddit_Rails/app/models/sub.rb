class Sub < ApplicationRecord
    validates :name, :description, presence: true 
    validates :name, uniqueness: true

    belongs_to :moderator, class_name: :User, foreign_key: :moderator_id 
    has_many :post_subs, dependent: :destroy, inverse_of: :sub
    has_many :posts, through: :post_subs, source: :post 


end