require 'fileutils'

class WithGems
  def initialize
    @gem_dir = './gems'
  end
  def install(gem_name)
    run "gem install --conservative #{gem_name}"
  end
  def run(whatever)
    FileUtils.mkpath @gem_dir
    cmd = "GEM_HOME='#{@gem_dir}';GEM_PATH='' #{whatever}"
    puts cmd + ':'
    Kernel.system cmd
  end
end

def with_gems
  WithGems.new
end
