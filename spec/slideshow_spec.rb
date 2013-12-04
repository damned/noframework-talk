require_relative '../lib/slideshow'

module NoFramework
  describe SlideShow do
    describe '#first' do
      let(:layout) { double('layout', left: nil, centre: nil, start_list: nil, end_list: nil)}
      let(:output) { double('output') }

      it 'should centre the title and name' do
        talk = Talk.new({
              'title' => 'foobar',
              'by' => 'zebs',
              'description' =>
              {
                  'points' => []
              }
        }.to_json)

        show = SlideShow.new(talk, output, layout)

        show.first

        expect(layout).to have_received(:centre).with('foobar')
        expect(layout).to have_received(:centre).with('zebs')
      end

      it 'should list description points' do
        talk = Talk.new({'title' => '', 'by' => '',
                            'description' =>
                              {
                                  'points' => [
                                      'first point',
                                      'second point',
                                      {
                                          'point' => 'third point has subpoints',
                                          'points' => [ 'some point', 'another point']
                                      }
                                  ]
                              }
                        }.to_json)

        show = SlideShow.new(talk, output, layout)

        show.first

        expect(layout).to have_received(:left).with('first point')
        expect(layout).to have_received(:left).with('second point')
        expect(layout).to have_received(:left).with('third point has subpoints')
        expect(layout).to have_received(:start_list)
          expect(layout).to have_received(:left).with('some point')
          expect(layout).to have_received(:left).with('another point')
        expect(layout).to have_received(:end_list)
      end
    end
  end
end