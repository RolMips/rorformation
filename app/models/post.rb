class Post < ApplicationRecord

    belongs_to :category, counter_cache: :posts_count
    has_and_belongs_to_many :tags
    has_many :metas, as: :metaable

    scope :online, -> (online) { where(online: online) }

    validates :title, uniqueness: true, presence: true, length: {minimum:3, maximum:100}
    validates :content, presence: true

end
