require 'json'

module NoFramework
  class Slide
    def initialize(fields)
      @fields = fields
    end

    def title
      @fields['title']
    end
    def author
      @fields['by']
    end

    def visit_points(&block)
      list = @fields['description']
      visit_list(list['points'], &block)
    end

    def visit_list(list, &block)
      list.each { |value|
        case value
          when String
            yield :point, value
          when Hash
            yield :list, value['point']
            visit_list value['points'], &block
            yield :end_list
          else
            # do nothin
        end
      }
    end
  end
  class Talk
    def first
      Slide.new(JSON.parse File.read('content/talk.json'))
    end
  end
end
