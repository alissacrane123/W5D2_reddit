class PostSub < ApplicationRecord

    belongs_to :post,
    class_name: :Post,
    foreign_key: :post_id 

    belongs_to :sub,
    class_name: :Sub,
    foreign_key: :sub_id 
end
