source "https://rubygems.org"

ruby "3.3.0"

# ✅ Rails core
gem "rails", "~> 7.1.3"

# ✅ Database
gem "pg", "~> 1.1"

# ✅ Server
gem "puma", ">= 5.0"

# ✅ Assets (for importmap setup)
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# ✅ CSS & JS Bundling (Bootstrap)
gem "cssbundling-rails", "~> 1.3", ">= 1.3.3"
gem "bootstrap", "~> 5.3"
gem "sassc-rails"

# ✅ ActiveAdmin + Devise (Admin panel & Authentication)
gem "activeadmin"
gem "devise"
gem "activeadmin_quill_editor"

# ✅ JSON builder
gem "jbuilder"

# ✅ Asset pipeline support
gem "sprockets-rails"

# ✅ Performance
gem "bootsnap", require: false

# ✅ Timezone fix for Windows (optional)
gem "tzinfo-data", platforms: %i[windows jruby]

# ✅ For production logging (Render uses this)
gem "rack-cors"

# ✅ Environment variables (optional but useful)
gem "dotenv-rails"

# ✅ Dev/Test environment
group :development, :test do
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
gem 'arctic_admin'