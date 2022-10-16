module Taggl
  module Tag
    module Filter
      # @private
      Nothing = Class.new do
        include Filter

        def required_tag?(_tag)
          false
        end

        def excluded_tag?(_tag)
          false
        end

        def required_one_of_tag?(_tag)
          false
        end

        def untagged_only?
          false
        end

        def to_s
          "_all"
        end

        def select(_tags)
          true
        end
      end.new

      private_constant :Nothing
    end
  end
end
