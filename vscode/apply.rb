#!/usr/bin/env ruby

DELIMITER = "  /* settings above is not backed up */\n"

dist = $*[0]

unless dist
  warn "Usage #{$0} <dist>"
  exit 129
end

base = File.join(File.expand_path(__dir__), "settings.json")

local_settings = begin
  settings = File.readlines(dist)
  setting_index = settings.index(DELIMITER) || -1

  settings[0..setting_index-1]
rescue ::Errno::ENOENT
  [ "{\n" ]
end

base_settings = File.readlines(base)

File.write(dist, (local_settings + base_settings[base_settings.index(DELIMITER)..-1]).join)