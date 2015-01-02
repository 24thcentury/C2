desc "Open vim"
task :vim do
  SSHKit.config.backend = SSHKit::Backend::SshCommand
  on primary(:nat) do |host|
    execute(:vim)
  end
end
