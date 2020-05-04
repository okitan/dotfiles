#!/usr/bin/env ruby

DELIMITER = "  /* settings above is not backed up */\n"

source = $*[0]

unless source
  warn "Usage #{$0} <source>"
  exit 129
end

base = File.join(File.expand_path(__dir__), "settings.json")

settings = File.readlines(source)
setting_index = settings.index(DELIMITER) || -1

File.write(base, (["{\n"] +  settings[setting_index..-1]).join)

