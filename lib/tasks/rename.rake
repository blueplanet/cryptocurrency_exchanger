namespace :rename do
  desc 'change application name'
  task :to, ['new_application_name'] => :environment do |task, args|
    new_application_name = args[:new_application_name]

    system "git grep -l 'module Rails5base' -- './*' ':!lib/tasks/rename.rake' |xargs sed -i '' 's/Rails5base/#{new_application_name.camelize}/g'"
    system "git grep -l 'rails5base' -- './*' ':!lib/tasks/rename.rake' |xargs sed -i '' 's/rails5base/#{new_application_name}/g'"
    system "git remote rm origin"
  end
end
