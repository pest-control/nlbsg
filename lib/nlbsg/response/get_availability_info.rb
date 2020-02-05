module NLBSG
  class GetAvailabilityInfoResponse < ResponseBase

    def initialize(response)
      super(response.to_hash[:get_availability_info_response])
    end

    def next_record_position
      @response[:next_record_position]
    end

    def set_id
      @response[:set_id]
    end

    def items
      wrap_in_array(@response.dig(:items, :item))
    end

    def fetch_next_records
      p "TODO"
    end
  end
end
