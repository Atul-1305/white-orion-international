# config/initializers/ransack.rb
Rails.application.config.to_prepare do
  # ✅ Patch ActiveRecord::Base to make all attributes searchable by default
  ActiveRecord::Base.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      reflect_on_all_associations.map(&:name).map(&:to_s)
    end
  end
end
