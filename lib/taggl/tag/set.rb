module Taggl
  module Tag
    class Set
      # @param tags [<String>,#each,Set] set of tags or enumerable of tags
      # @return [Set] if already a Set, returned unchanged, otherwise parsed
      #   into a Set
      def self.parse(tags)
        return tags if tags.is_a?(self)

        new(tags)
      end

      # @param tags [<String>,#each] array of tags or enumerable of tags
      def initialize(tags)
        @tags = ::Set.new(tags)
      end

      # @param rtag [String]
      # @return [void]
      def add(rtag)
        @tags.add(rtag)
      end

      # @param rtag [String]
      # @return [Boolean]
      def include?(rtag)
        @tags.include?(rtag)
      end

      # @param rtags [Set<String>]
      # @return [Boolean]
      def include_all?(rtags)
        rtags.subset?(self)
      end

      # @param rtags [Set<String>]
      # @return [Boolean]
      def include_any?(rtags)
        return true if empty?

        @tags.intersect?(rtags.tags)
      end

      # @param rtags [Set<String>]
      # @return [Boolean]
      def subset?(rtags)
        return true if empty?

        @tags.subset?(rtags.tags)
      end

      # @param rtag [String]
      # @return [Boolean]
      def exclude?(rtag)
        !include?(rtag)
      end

      # @return [Boolean]
      def empty?
        @tags.empty?
      end

      # @yieldreturn [String] tag
      # @return [Enumerator]
      def each(&block)
        @tags.each(&block)
      end

      # @return [<String>]
      def to_a
        @tags.to_a
      end

      # @return [Integer]
      def size
        @tags.size
      end

      protected

      def tags
        @tags
      end
    end
  end
end
