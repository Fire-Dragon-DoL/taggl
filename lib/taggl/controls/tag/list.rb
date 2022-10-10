module Taggl
  module Controls
    module Tag
      module List
        extend self

        module Duplicates
          extend self

          def random(size: nil)
            size ||= 4
            raise ArgumentError, "Size must be greater than 0" if size < 1

            list = List.random
            list + [list[0]]
          end
        end

        def random(size: nil)
          size ||= 4
          size.
            times.
            map { Tag.random }
        end

        def empty
          []
        end
      end
    end
  end
end
