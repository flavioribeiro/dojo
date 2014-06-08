require 'rspec'
require_relative 'shannon_fano'


describe "Shannon-Fano" do

  it "should decode a simple hash to string" do
    decode({:header => {"0" => "A"},
            :body => '0'}).should == "A"
  end

  it "should decode a more complex hash to string" do
    decode({:header => {"0" => "A", "10" => "B", "11" => "C"},
            :body => '0101011'}).should == "ABBC"
  end

end

