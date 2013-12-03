module NoFramework
  class SlideShow
    def first
      File.read 'content/talk.json'
    end
  end
end