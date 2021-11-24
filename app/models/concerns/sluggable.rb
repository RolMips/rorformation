module Sluggable

    extend ActiveSupport::Concern

    included do
      before_validation :set_default_slug, on: [:create, :update]
      validates :slug, format: {with: /\A[a-z0-9\-]+\z/}, uniqueness: true
      private
      def set_default_slug
        if !self.name.nil? && !self.name.empty? && (self.slug.nil? || self.slug.empty?)
          self.slug = self.name.parameterize
        end
      end
    end
  end
