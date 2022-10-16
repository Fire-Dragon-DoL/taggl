module Taggl
  module Tag
    module Filter
      # @private
      class Query
        include Filter

        def initialize(one_of: nil, required: nil, excluded: nil, untagged: false)
          one_of ||= Set.new([])
          required ||= Set.new([])
          excluded ||= Set.new([])
          untagged = !!untagged
          @one_of = one_of
          @required = required
          @excluded = excluded
          @untagged = untagged
        end        

        # @param tag [String] tag expected to be required
        # @return [Boolean]
        def required_tag?(tag)
          @required.include?(tag)
        end

        # @param tag [String] tag expected to be omitted
        # @return [Boolean]
        def excluded_tag?(tag)
          @excluded.include?(tag)
        end

        # @param tag [String] tag is in the group of at least one required
        # @return [Boolean]
        def required_one_of_tag?(tag)
          @one_of.include?(tag)
        end

        # @return [Boolean]
        def untagged_only?
          @one_of.empty? && @required.empty? && @excluded.empty? && @untagged
        end

        # @param tags [<String>,#each,Set] tag list that must satisfy the query
        #   filter
        # @return [Boolean] true if the query filter is satisfied
        def select(tags)
          tagset = Set.parse(tags)

          return @untagged if tags.empty?
          return false if !@required.subset?(tagset)
          return false if !@excluded.empty? && @excluded.include_any?(tagset)
          return false if !@one_of.include_any?(tagset)
          return false if untagged_only? && !tagset.empty?

          true
        end

        # @return [String]
        def to_s
          tags = []

          tags << Parse::UntaggedKeyword if @untagged

          @one_of.each { |tag| tags << tag }
          @required.each { |tag| tags << Parse.required_tag(tag) }
          @excluded.each { |tag| tags << Parse.excluded_tag(tag) }

          tags.join(Parse::Separator)
        end
      end

      private_constant :Query
    end
  end
end
