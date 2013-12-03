require 'popen4'

describe 'talk' do
  describe 'play' do
    before :each do
      status = POpen4::popen4( cmd_ ) do |stdout, stderr, stdin|
          [stdout, stderr].each do |line|
            puts line
          end
        end
      puts
    end
  end
end
