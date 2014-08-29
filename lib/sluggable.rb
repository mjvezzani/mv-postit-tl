module Sluggable

  extend ActiveSupport::Concern

  included do
    before_save :generate_slug
    class_attribute :slug_column
  end

  def generate_slug
    self.slug = self.send(self.class.slug_column).gsub(' ', '-').downcase
  end

  def to_param
    self.slug
  end

  module ClassMethods
    def sluggable_column(col_name)
      self.slug_column = col_name
    end
  end

end
