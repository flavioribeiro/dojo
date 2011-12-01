require 'rspec'
require 'shannon_fano'


describe "Shannon-Fano" do

  it "should normalize simple tree to hash" do
    simple_tree = ['A', '0']
    normalize(simple_tree).should == {"A" => "0"}
  end

  it "should normalize complex tree to hash" do
    complex_tree = {
      :left => ['A','0'],
      :right => ['B','1']
    }
    normalize(complex_tree).should == {"A" => "0", "B" => "1"}
  end

  it "should normalize more complex tree to hash" do
    complex_tree = {
      :left => ['A','0'],
      :right => {
        :left => ['B','10'],
        :right => ['C','11']
      }
    }
    normalize(complex_tree).should == {"A" => "0", "B" => "10", "C" => "11"}
  end


  it "should return 0 for single symbol" do
     encode("A").should == {:header => {"A" => "0"},
                            :body => '0'}
  end

  it "should return 0 for any single symbol" do
    encode("AAABBC").should == { :header => {"A" => "0",
                                             "B" => "10",
                                             "C" => "11"},
                                 :body => '000101011'}
  end
end