describe "Application 'TestFun'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

  it "has one controller" do
    controller = @app.keyWindow.rootViewController
    controller.is_a?(ButtonController).should == true
  end
end
