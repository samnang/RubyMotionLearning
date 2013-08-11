class AppDelegate < PM::Delegate
  include PM::Styling
  status_bar true, animation: :none

  def on_load(app, options)
    set_appearance_defaults
    open HomeScreen.new(nav_bar: true)
  end

  def set_appearance_defaults
    UINavigationBar.appearance.tintColor = hex_color("61B637")
  end
end
