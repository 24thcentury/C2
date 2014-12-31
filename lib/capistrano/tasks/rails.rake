namespace :rails do

  desc "Print Rails routes"
  task :routes do
    on primary(:app) do |host|
      as 'app-user' do
        puts capture('cd /var/src/c2/current && RAILS_ENV=production /opt/rbenv/shims/bundle exec rake routes')
      end
    end
  end

end
