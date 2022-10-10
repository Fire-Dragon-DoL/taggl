module Taggl
  module Controls
    module Tag
      module Set
        extend self

        def random(size: nil)
          Taggl::Tag::Set.new(List.random(size: size))
        end

        def empty
          Taggl::Tag::Set.new([])
        end
      end
    end
  end
end
