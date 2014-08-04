

namespace :app do
  desc 'Drop, create, migrate, and seed the application'
  task reset: ['db:drop', 'db:create', 'db:migrate', 'db:seed']
end