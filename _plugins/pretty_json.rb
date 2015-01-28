module Jekyll
  module PrettyJsonFilter
 
    def pretty_json(input)
      begin
        JSON.pretty_generate(input)
      rescue JSON::GeneratorError => e
        "Error: #{e}."
      end
    end
 
  end
end
 
Liquid::Template.register_filter(Jekyll::PrettyJsonFilter)
 
# USAGE:
# {{ site.data.user | pretty_json }}