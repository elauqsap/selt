describe "dessert" do
  it "should define a constructor" do
    lambda { Dessert.new }.should_not raise_error(::NoMethodError)
  end
  %w(healthy? delicious?).each do |method|
    it "should define #{method}" do
      Dessert.new('a',1).should respond_to method
    end
  end  
end


describe "jellybean" do
  it "should define a constructor" do
    lambda { JellyBean.new }.should_not raise_error(::NoMethodError)
  end
  %w(healthy? delicious? ).each do |method|
    it "should define #{method}" do
      JellyBean.new('a',1, 2).should respond_to method 
    end
  end
end
