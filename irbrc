#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

class Object
  def copy_history
    history = Readline::HISTORY.entries
    index = history.rindex("exit") || -1
    content = history[(index+1)..-2].join("\n")
    puts content
    copy content
  end
end
