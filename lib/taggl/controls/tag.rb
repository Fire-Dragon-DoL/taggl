module Taggl
  module Controls
    module Tag
      extend self

      def random
        id = SecureRandom.uuid
        id = id.gsub("-", "")
        "tag#{id}"
      end
    end
  end
end
