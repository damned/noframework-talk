require 'fileutils'

class WithGems
  def initialize
    @gem_dir = './gems'
  end
  def install(gem_name)
    run "gem install #{gem_name}"
  end
  def run(whatever)
    FileUtils.mkpath @gem_dir
    puts `GEM_HOME="#{@gem_dir}";GEM_PATH="" #{whatever}`
  end
end

def with_gems
  WithGems.new
end
