require 'rspec'
require_relative 'shannon_fano'


describe "Shannon-Fano" do
  it "should return bla for single symbol" do
    tokenize("A").should == [['A',1]]
    tokenize("B").should == [['B',1]]
  end

  it "should return foo for multiple digits" do
    tokenize("AA").should == [['A',2]]
    tokenize("BBB").should == [['B',3]]
    tokenize("CCCC").should == [['C',4]]
  end

  it "should return bar for multiple digits" do
    tokenize("AAB").should == [['A',2],['B',1]]
    tokenize("ABB").should == [['B',2],['A',1]]
  end

  it "should return bar2 for multiple digits" do
    tokenize("AAABBC").should == [['A',3],['B',2],['C',1]]
    tokenize("ABBCCC").should == [['C',3],['B',2],['A',1]]
    tokenize("ACBABCABB").should == [['B',4], ['A',3],['C',2]]
  end

  it "should split tokens upon weight" do
    tokens = [['A',3],['B',2]]
    make_tree(tokens).should == {
      :left => ['A','0'],
      :right => ['B','1']
    }
  end

  it "should split single token into an array of itself" do
    tokens = [['A',3]]
    make_tree(tokens).should == ['A','0']
  end

  it "should return symbols with same weight" do
    tokens = [['A',2],['B',2]]
    make_tree(tokens).should == {
      :left => ['A','0'],
      :right => ['B','1']
    }
  end

  it "should split tokens upon weight" do
    tokens = [['A',3],['B',2],['C',1]]
    make_tree(tokens).should == {
      :left => ['A','0'],
      :right => {
        :left => ['B','10'],
        :right => ['C','11']
      }
    }
  end

end