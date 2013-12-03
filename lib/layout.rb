module NoFramework

  class Layout
    def initialize(output)
      @output = output
      @indent = ''
      @bullet = ' o '
      validate
    end

    def centre(s)
      left_indent = ((100 - s.length) / 2)
      output (' ' * left_indent) + s
    end

    def left(x)
      output @indent + @bullet + x.to_s
    end

    def start_list
      @indent = '   '
    end
    def end_list
      @indent = ''
    end

    private

    def output(s)
      @output.print(s)
    end

    def validate
      raise InvalidArgumentError.new('need output') unless @output.respond_to? :print
    end
  end

end
