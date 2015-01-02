desc "Open vim"
task :vim do
  SSHKit.config.backend = SSHKit::Interactive::Backend
  on primary(:nat) do |host|
    execute(:vim)
  end
end
