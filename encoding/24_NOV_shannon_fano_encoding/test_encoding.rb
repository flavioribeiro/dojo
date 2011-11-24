require 'rspec'
require 'shannon_fano'


describe "Shannon-Fano" do
  
  it "should return 0 for single symbol" do
    encode("A").should == {:header => {"A" => 0},
                           :body => '0'}
  end
  
  it "should return 0 for any single symbol" do
    encode("B").should == {:header => {"B" => 0},
                           :body => '0'}

  end
end