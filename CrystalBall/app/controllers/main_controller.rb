class MainController < UIViewController
  def viewDidLoad
    super

    view.addSubview(background_image)

    @label = make_label
    view.addSubview(@label)

    @button = make_predict_button
    view.addSubview(@button)
  end

  private

  def background_image
    image = UIImage.imageNamed("background.png")
    UIImageView.alloc.initWithImage(image)
  end

  def make_label
    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.font = UIFont.boldSystemFontOfSize(20)
    label.text = crystal_ball.random_prediction
    label.textColor = UIColor.whiteColor
    label.backgroundColor = UIColor.clearColor
    label.textAlignment = NSTextAlignmentCenter
    label.numberOfLines = 2
    label.sizeToFit

    padding = 50
    label.frame = [
      [padding, (screen_size.height - label.size.height) / 2],
      [screen_size.width - 2*padding, label.size.height * 2]
    ]

    label
  end

  def make_predict_button
    button = UIButton.buttonWithType(UIButtonTypeCustom)
    button.setImage(UIImage.imageNamed("button_bg_off.png"), forState: UIControlStateNormal)
    button.setImage(UIImage.imageNamed("button_bg_on.png"), forState: UIControlStateSelected)

    padding = 20
    button.frame = [
      [padding, screen_size.height - 30 - padding],
      [screen_size.width - 2*padding, 30]
    ]

    button.addTarget(self, action: 'predict_tapped', forControlEvents: UIControlEventTouchUpInside)

    button
  end

  def predict_tapped
    UIView.animateWithDuration(
      1.0,
      animations: -> {
        @label.alpha = 0
        @label.transform = CGAffineTransformMakeScale(0.1, 0.1)
      },
      completion: ->(finished) {
        @label.text = crystal_ball.random_prediction
        UIView.animateWithDuration(1.0, animations: -> {
          @label.alpha = 1
          @label.transform = CGAffineTransformIdentity
        })
      }
    )
  end

  def screen_size
    view.frame.size
  end

  def crystal_ball
    @crystal_ball ||= CrystalBall.new
  end
end
