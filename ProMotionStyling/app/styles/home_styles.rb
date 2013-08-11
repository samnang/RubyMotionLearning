module HomeStyles
  def main_view_style
    {
      background_color: hex_color("DBDBDB")
    }
  end

  def label_style
    {
      text: "August",
      text_color: hex_color("8F8F8D"),
      background_color: UIColor.clearColor,
      shadow_color: UIColor.blackColor,
      text_alignment: UITextAlignmentCenter,
      font: UIFont.systemFontOfSize(15.0),
      resize: [ :left, :right, :bottom ],
      frame: CGRectMake(10, 0, 300, 35)
    }
  end
end
