require 'rake'
require 'erb'
require 'yaml'

task :default => [:deps, :install]

desc "check dependencies"
task :deps do
  puts "checking dependencies..."
  all_deps = true
  missing_deps = []
  %w[ag ctags git].each do |dep|
    has_dep = ENV['PATH'].split(':').any? {|folder| File.exists?(folder + "/#{dep}")}
    unless has_dep
      all_deps = false
      missing_deps << dep
    end
    puts "#{dep}: #{has_dep ? 'yes' : 'no'}"
  end
  if !all_deps
    puts "Some dependencies are missing, please consider installing them with:"
    if OS.mac?
      puts "brew install #{missing_deps.join}"
    else
      apt_deps = {'ctags' => 'exuberant-ctags', 'ag' => 'silversearcher-ag', 'git' => 'git-core'}
      puts "sudo apt-get install #{apt_deps.values_at(missing_deps).join}"
    end
    exit
  end
end

desc "install the dot files into user's home directory"
task :install => :configure do
  update_submodules
  install_oh_my_zsh
  switch_to_zsh
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md LICENSE config.yml config.yml.example com.googlecode.iterm2.plist]
  if OS.mac?
    files -= %w[Xdefaults awesome]
  end
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if file =~ /\.erb$/ && ERB.new(File.read(file)).result(binding) == File.read(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

desc "create/update the config file"
task :configure do
  keys = YAML.load_file('config.yml.example').keys
  current_config = File.exists?('config.yml') ? YAML.load_file('config.yml') : {}
  if OS.mac?
    current_config['name'] ||= `osascript -e "long user name of (system info)"`.strip
  end
  keys.each do |k|
    default = current_config[k] ? " (default: #{current_config[k]})" : ''
    print "#{k}#{default}:"
    v = $stdin.gets.strip
    current_config[k] = v == "" ? current_config[k] : v
  end
  puts "Saving config file"
  File.open('config.yml', 'w') do |out|
    YAML.dump current_config, out
  end
end

def config
  @config ||= YAML.load_file('config.yml')
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  elsif file =~ /zshrc$/ # copy zshrc instead of link
    puts "copying ~/.#{file}"
    system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def update_submodules
  puts "fetching submodules"
  system %Q{git submodule update --init}
end

module OS
  def self.mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def self.linux?
    (/linux/ =~ RUBY_PLATFORM) != nil
  end
end
