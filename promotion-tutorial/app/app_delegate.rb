class AppDelegate < ProMotion::Delegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    open HomeScreen.new(nav_bar: true)

    true
  end
end
