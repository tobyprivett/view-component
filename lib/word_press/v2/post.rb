module WordPress
  module V2
    class Post < Base
      class << self
        def all
          self.new.posts
        end

        def find(id)
          self.new.post(id)
        end
      end

      def posts
        request(
          http_method: :get,
          endpoint: "?rest_route=/wp/v2/posts"
        )
      end

      def post(id)
        request(
          http_method: :get,
          endpoint: "?rest_route=/wp/v2/posts/#{id}"
        )
      end
    end
  end
end
