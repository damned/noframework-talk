describe 'talk' do
  describe 'slideshow' do
    let(:output) { `./slideshow` }

    it 'should show title slide' do
      expect(output).to include 'NoFramework'
      expect(output).to include 'dan moore'
    end

    it 'should remove unnecessary syntax' do
      expect(output).to_not include '{', '{', '[', ']'
      end

    it 'should use a few lines' do
      expect(output.split("\n").length).to be > 6
    end
  end
end
