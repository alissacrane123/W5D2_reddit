class Post < ApplicationRecord
    validates :title, presence: true 
    validates :subs, presence: { message: 'must have at least one sub'}


    has_many :post_subs, dependent: :destroy, inverse_of: :post 
    has_many :subs, through: :post_subs, source: :sub
    belongs_to :author, class_name: :User, foreign_key: :author_id
    has_many :comments, class_name: :Comment, foreign_key: :post_id 
end
