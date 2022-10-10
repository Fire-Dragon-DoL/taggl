module Taggl
  module Controls
    module Tag
      module Enumerable
        extend self

        def random(size: nil)
          List.random(size: size).each
        end

        def empty
          [].each
        end
      end
    end
  end
end

