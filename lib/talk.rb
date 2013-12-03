require 'json'

module NoFramework
  class SlideShow
    def initialize(output)
      @output = output
      validate
    end

    def first
      content = strip_noise(Talk.new.first)
      output strip_empty_lines(content)
    end

    private

    def validate
      raise InvalidArgumentError.new('need output') unless @output.respond_to? :print
    end

    def output(s)
      @output.print(s)
    end

    def strip_empty_lines(multiline)
      multiline.split("\n").collect(&:strip).reject(&:empty?).join "\n"
    end

    def strip_noise(noisy)
      noisy.gsub(/[{}\[\]]/, '')
    end
  end

  class Talk
    def first
      File.read('content/talk.json')
    end
  end
end
