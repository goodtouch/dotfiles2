require 'rake'
require 'erb'
require 'yaml'

desc "check dependencies"
task :deps do
  puts "checking dependencies..."
  all_deps = true
  %w[ack ctags git].each do |dep|
    has_dep = ENV['PATH'].split(':').any? {|folder| File.exists?(folder + "/#{dep}")}
    all_deps = all_deps && has_dep
    puts "#{dep}: #{has_dep ? 'yes' : 'no'}"
  end
  if !all_deps
    puts "Some dependencies are missing, please consider installing them with:"
    puts "sudo apt-get install exuberant-ctags ack-grep"
    STDIN.getc
  end
end

desc "create/update the config file"
task :configure do
  keys = YAML.load_file('config.yml.example').keys
  current_config = File.exists?('config.yml') ? YAML.load_file('config.yml') : {}
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

desc "install the dot files into user's home directory"
task :install => :configure do
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md LICENSE config.yml config.yml.example Xresources-font.example]
  if OS.mac?
    files -= %w[Xdefaults awesome urxvt]
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

module OS
  def self.mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def self.linux?
    (/linux/ =~ RUBY_PLATFORM) != nil
  end
end
