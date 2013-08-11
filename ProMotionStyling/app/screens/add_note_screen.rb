class AddNoteScreen < PM::Screen
  include HomeStyles

  title "Add Note"

  def on_load
    set_attributes self.view, main_view_style

    add UITextView.new, {
      frame: CGRectMake(20, 20, 280, 220),
      layer: {
        shadow_radius: 4.0,
        shadow_opacity: 0.4,
        shadow_color: UIColor.blackColor.CGColor,
        masks_to_bounds: false
      }
    }

    set_nav_bar_button :right, title: "Save", action: :save
  end
end
