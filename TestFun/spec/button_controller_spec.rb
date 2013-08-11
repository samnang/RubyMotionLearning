describe "ButtonController" do
  tests ButtonController

  it "changes color after tapping" do
    tap("Tap Me")
    controller.instance_variable_get("@tapped").should == true
  end
end
