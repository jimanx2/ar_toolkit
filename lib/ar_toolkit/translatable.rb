module ArToolkit
  class Translatable < ActiveRecord::Base
    self.primary_key = :model_id
  end
end