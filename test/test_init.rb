TestBench.activate

require "pry-byebug" rescue nil

$LOAD_PATH.unshift(File.expand_path("../lib/taggl", __dir__))

require "taggl"
require "taggl/controls"

include Taggl
