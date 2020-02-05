module NLBSG
  class ResponseBase

    attr_accessor :response

    def initialize(response)
      @response = response
    end

    def status
      response[:status]
    end

    def message
      response[:message]
    end

    def error_message
      response[:error_message]
    end

    private

      def wrap_in_array(object)
        if object.nil?
          []
        elsif object.is_a?(Array)
          object
        else
          [object]
        end
      end
  end
end

require_relative "response/search"
require_relative "response/get_title_details"
require_relative "response/get_availability_info"
