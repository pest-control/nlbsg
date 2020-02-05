module NLBSG
  class Client

    DEFAULT_CONFIG =
      {
        convert_request_keys_to: :camelcase,
        open_timeout: 300,
        read_timeout: 300
      }

    def search(options)
      request = SearchRequest.new(options).build
      response = client.call(:search, message: request)
      SearchResponse.new(response)
    end

    def get_title_details(options)
      request = GetTitleDetailsRequest.new(options).build
      response = client.call(:get_title_details, message: request)
      GetTitleDetailsResponse.new(response)
    end

    def get_availability_info(options)
      request = GetAvailabilityInfoRequest.new(options).build
      response = client.call(:get_availability_info, message: request)
      GetAvailabilityInfoResponse.new(response)
    end

    def operations
      client.operations
    end

    alias_method :title, :get_title_details
    alias_method :availability, :get_availability_info

    private

      def client
        @client ||= Savon.client(config)
      end

      def config
        DEFAULT_CONFIG.merge(wsdl: wsdl)
      end

      def wsdl
        if NLBSG.env == :production
          NLBSG::WSDL[:production]
        elsif NLBSG.env == :staging
          NLBSG::WSDL[:staging]
        end
      end
  end
end
