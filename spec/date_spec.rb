
require 'rext/date'

describe Date do
  describe "helpers" do
    describe "#to_time" do
      it "should convert to a Time instance" do
        event = Date.parse('may 25th 1987')
        event.to_time.should be_an_instance_of(Time)
      end
    end
  end
end