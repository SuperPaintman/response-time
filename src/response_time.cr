require "http/server/handler"

require "./response_time/*"

module ResponseTime
  class Handler
    include HTTP::Handler

    def initialize(@header = "X-Response-Time", @suffix = true)
    end

    def call(context)
      time = Time.now

      call_next context

      elapsed = Time.now - time

      millis = elapsed.total_milliseconds.to_s
      context.response.headers[@header] = @suffix ? "#{millis}ms" : millis
    end
  end
end
