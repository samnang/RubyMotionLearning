class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @user = User.load
    @user ||= User.new(
      id: "1",
      name: "Samnang",
      email: "samnang.chhun@gmail.com",
      phone: "1111-1111"
    )

    controller = UserController.alloc.initWithUser(@user)
    nav_controller = UINavigationController.alloc.initWithRootViewController(controller)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = nav_controller
    @window.makeKeyAndVisible

    true
  end

  def applicationDidEnterBackground(application)
    @user.save
  end
end
