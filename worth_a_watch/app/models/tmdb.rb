module TMDB  
    def search( options = {})
        raise ArgumentError, 'query cant be empty' if options[:query].blank?

        options = options.merge( {:api_key => API_KEY} )
        Request.where('/3/search/movie', options)
    end
  class Search < Base
        
        attr_accessor   :page,
                        :total_results,
                        :total_pages,
                        :results

        def initialize(query)
            raise ArgumentError 'Query must be a string' if !query.is_a?(String)

            response = search(:query => query )

            # TODO: error handling
            if response.errors.exists?
                raise ArgumentError 'somethings wrong'
            end

            super(json)
            self.results = parse_results(json)
        end
                        
        private


        def parse_results(json)
            json.fetch("results", []).map { |film| Film.new(film)}
        end
    end

    class Movie < Base
        attr_accessor   :vote_count,
        :id,
        :video,
        :vote_average,
        :title,
        :popularity,
        :poster_path,
        :original_language,
        :original_title,
        :genre_ids,
        :backdrop_path,
        :adult,
        :overview,
        :release_date

        def adult?
            @adult
        end
    end

    class Base
        attr_accessor :errors
    
        def initialize(args = {})
            args.each do |k,v|
                attr_name = k.to_s.underscore
                
                if respond_to?("#{attr_name}=")
                    send("#{attr_name}=", v)
                end
            end
        end
    end
end