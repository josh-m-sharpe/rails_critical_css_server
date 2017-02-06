module RailsCriticalCssServer
  class Config
    class << self
      attr_writer :host, :version, :timeout, :force_selectors, :auth_token, :width, :height

      def timeout
        @timeout ||= 0.05
      end

      def host
        @host ||= ENV['CRITICAL_CSS_SERVER_URL']
      end

      def version
        @version ||= ENV['HEROKU_RELEASE_VERSION']
      end

      def auth_token
        @auth_token ||= ENV['CRITICAL_CSS_SERVER_AUTH_TOKEN']
      end

      def force_selectors
        @force_selectors ||= []
      end

      def width
        @width ||= 1200
      end

      def height
        @height ||= 900
      end

      def read_options
        {
          'forceInclude' => force_selectors,
          'width' => width,
          'height' => height
        }
      end
    end
  end
end
