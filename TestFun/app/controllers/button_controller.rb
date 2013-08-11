class ButtonController < UIViewController
  def viewDidLoad
    super

    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle("Tap Me", forState: UIControlStateNormal)
    button.sizeToFit
    button.addTarget(
      self,
      action: 'tapped',
      forControlEvents: UIControlEventTouchUpInside
    )
    self.view.addSubview(button)

    @tapped = false
  end

  def tapped
    @tapped = true
    self.view.backgroundColor = UIColor.redColor
  end
end
