#!/usr/bin/env bash
# Exit on error
set -o errexit

echo "🔧 Installing gems..."
bundle install --without development test

echo "🧱 Precompiling assets..."
bundle exec rake assets:clobber
bundle exec rake assets:precompile

echo "🗄️ Running migrations..."
bundle exec rake db:migrate

echo "✅ Build completed successfully!"
