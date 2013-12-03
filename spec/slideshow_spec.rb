require_relative '../lib/slideshow'

module NoFramework
  describe SlideShow do
    describe '#first' do
      let(:layout) { double('layout', left: nil, centre: nil, start_list: nil, end_list: nil)}
      let(:show) { SlideShow.new(double('output'), layout)}

      it 'should centre the title and my name' do
        show.first

        expect(layout).to have_received(:centre).with('NoFramework')
        expect(layout).to have_received(:centre).with('dan moore')
      end

      it 'should list description points' do
        show.first

        expect(layout).to have_received(:left).with('Developing an application without a fat framework')
        expect(layout).to have_received(:left).with('Probably on web')
        expect(layout).to have_received(:left).with('including')
        expect(layout).to have_received(:start_list)
        expect(layout).to have_received(:left).with('what')
        expect(layout).to have_received(:left).with('how')
        expect(layout).to have_received(:left).with('when')
        expect(layout).to have_received(:left).with('why')
        expect(layout).to have_received(:end_list)
      end
    end
  end
end