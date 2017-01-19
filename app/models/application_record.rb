# frozen_string_literal: true

# Add all model methods that should be common to all models to this base class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
