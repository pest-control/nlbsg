module NLBSG
  class RequestBase

    attr_accessor :options

    def build(options)
      options.merge(API_key: NLBSG.key)
    end
  end
end

require_relative "request/search"
require_relative "request/get_title_details"
require_relative "request/get_availability_info"
