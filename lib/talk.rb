require 'json'

module NoFramework
  class SlideShow
    def first
      Talk.new.first.gsub(/[{}\[\]]/, '')
    end
  end
  class Talk
    def first
      File.read('content/talk.json')
    end
  end
end