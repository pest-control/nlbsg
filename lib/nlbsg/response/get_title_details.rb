module NLBSG
  class GetTitleDetailsResponse < ResponseBase

    def initialize(response)
      super(response.to_hash[:get_title_details_response])
    end

    def title_detail
      response[:title_detail]
    end

    def bid
      title_detail[:bid]
    end

    def title_name
      title_detail[:title_name]
    end

    def author
      title_detail[:author]
    end

    def other_authors
      title_detail[:other_authors]
    end

    def publisher
      title_detail[:publisher]
    end

    def physical_desc
      title_detail[:physical_desc]
    end

    def subject
      title_detail[:subject]
    end

    def summary
      title_detail[:summary]
    end

    def notes
      title_detail[:notes]
    end

    def isbn
      title_detail[:isbn]
    end

    def issn
      title_detail[:issn]
    end

    def n_title_name
      title_detail[:n_title_name]
    end

    def n_author_name
      title_detail[:n_author_name]
    end

    def n_publisher
      title_detail[:n_publisher]
    end
  end
end
