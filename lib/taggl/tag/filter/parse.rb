module Taggl
  module Tag
    module Filter
      # Parses text input into a filter capable of selecting and rejecting
      # tag sets based on the query
      module Parse
        extend self

        Separator = ","
        RequiredToken = "+"
        ExcludedToken = "-"
        AllKeyword = "_all"
        UntaggedKeyword = "_untagged"

        def required_tag(tag)
          "#{RequiredToken}#{tag}"
        end

        def excluded_tag(tag)
          "#{ExcludedToken}#{tag}"
        end

        # @param filter_text [String] text used to build tag filter
        # @return [Filter]
        def call(filter_text)
          input = filter_text.strip

          return Nothing if input.empty? || input == AllKeyword

          text_tags = input.split(Separator)

          required = Set.new([])
          one_of = Set.new([])
          excluded = Set.new([])
          untagged = false

          text_tags.each do |text_tag|
            tag = text_tag.strip
            next if tag.empty?

            case
            when tag == UntaggedKeyword
              untagged = true
            when tag.start_with?(RequiredToken)
              unprefixed_tag = tag.delete_prefix(RequiredToken)
              required.add(unprefixed_tag)
            when tag.start_with?(ExcludedToken)
              unprefixed_tag = tag.delete_prefix(ExcludedToken)
              excluded.add(unprefixed_tag)
            else
              one_of.add(tag)
            end
          end

          Query.new(
            one_of: one_of,
            required: required,
            excluded: excluded,
            untagged: untagged
          )
        end
      end
    end
  end
end
