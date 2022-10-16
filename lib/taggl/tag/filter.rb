module Taggl
  module Tag
    # Represents a filter capable of selecting and rejecting tag sets
    # @abstract
    module Filter
      # @param tag [String]
      # @return [Boolean]
      # @abstract
      def required_tag?(tag); end
      # @param tag [String]
      # @return [Boolean]
      # @abstract
      def excluded_tag?(tag); end
      # @param tag [String]
      # @return [Boolean]
      # @abstract
      def required_one_of_tag?(tag); end
      # @return [Boolean]
      # @abstract
      def untagged_only?; end
      # @param tags [<String>]
      # @retrun [Boolean]
      # @abstract
      def select(tags); end
      # @param tags [<String>]
      # @retrun [Boolean]
      def reject(tags)
        !select(tags)
      end
    end
  end
end
