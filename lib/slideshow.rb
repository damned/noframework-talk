require_relative 'layout'
require_relative 'talk'

module NoFramework

  class SlideShow
    def initialize(output, layout=Layout.new(output))
      @layout = layout
    end

    def first
      talk = Talk.new
      title_slide = talk.first
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

    def strip_empty_lines(multiline)
      multiline.split("\n").collect(&:strip).reject(&:empty?)
    end

    def strip_noise(noisy)
      noisy.gsub(/[{}\[\]]/, '')
    end
  end

end
