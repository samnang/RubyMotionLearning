class HomeScreen < ProMotion::GroupedTableScreen
  title "ProMotion Tutorial"

  def table_data
    [
      {
        title: "ProMotion",
        cells: [
          { title: "About ProMotion", action: :about_promotion },
          { title: "About Samnang", action: :about_samnang }
        ]
      },
      {
        title: "Help",
        cells: [
          { title: "Support", action: :support },
          { title: "Articles", action: :articles },
          { title: "Feedback", action: :feedback }
        ]
      }
    ]
  end

  def on_return(args={})
    if args[:saved]
      self.title = "Saved!"
    end
  end

  def about_promotion
    open AboutProMotionScreen
  end

  def about_samnang
    p "About Samnang tapped!"
  end

  def support
    p "Support tapped!"
  end

  def articles
    open ArticlesScreen
  end

  def feedback
    p "Feedback tapped!"
  end
end
