class Category < ApplicationRecord

    has_many :posts
    has_many :metas, as: :metaable

    include Sluggable

    validates :name, uniqueness: true, presence: true, length: {minimum:3, maximum:30}

end
