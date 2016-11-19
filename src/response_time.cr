require "http/server/handler"

require "./response_time/*"

module ResponseTime
  class Handler < HTTP::Handler
    alias CALLBACK = HTTP::Server::Context, Time::Span ->

    @callback = nil

    def initialize(@header = "X-Response-Time", @suffix = true)
    end

    def initialize(@header = "X-Response-Time", @suffix = true, &block : CALLBACK)
      @callback = block
    end

    def call(context)
      time = Time.now

      call_next context

      elapsed = Time.now - time

      millis = elapsed.total_milliseconds.to_s
      context.response.headers[@header] = @suffix ? "#{millis}ms" : millis

      if callback = @callback
        callback.call(context, elapsed)
      end
    end
  end
end
