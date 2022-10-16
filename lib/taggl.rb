require_relative "taggl/version"

require "set"

require_relative "taggl/tag/set"
require_relative "taggl/tag/filter"
require_relative "taggl/tag/filter/nothing"
require_relative "taggl/tag/filter/query"
require_relative "taggl/tag/filter/parse"

module Taggl
  class Error < RuntimeError; end
end
