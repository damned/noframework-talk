describe 'talk' do
  describe 'slideshow' do
    it 'should show title slide' do
      output = `./slideshow`
      expect(output).to include 'NoFramework'
      expect(output).to include 'dan moore'
    end
  end
end
