require_relative 'layout'
require_relative 'talk'

module NoFramework

  class SlideShow
    def initialize(talk, output, layout=Layout.new(output))
      @talk = talk
      @layout = layout
    end

    def first
      title_slide = @talk.first
      display(title_slide)
    end

    def display(slide)
      @layout.centre slide.title
      @layout.centre slide.author

      slide.visit_points { |type, text|
        if type == :list
          @layout.left text if (text != '')
          @layout.start_list
        end
        @layout.left text if type == :point
        @layout.end_list if type == :end_list
      }
    end

    private

  end

end
