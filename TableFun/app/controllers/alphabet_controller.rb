class AlphabetController < UIViewController
  def viewDidLoad
    super
    self.title = "Alphabet"
    #@table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table = UITableView.alloc.initWithFrame(self.view.bounds, style: UITableViewStyleGrouped)
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight
    self.view.addSubview(@table)

    @table.dataSource = self
    @table.delegate = self
    
    #@data = {
      #"A" => ["Adam", "Apple"],
      #"B" => ["Barry", "Berry"],
      #"C" => ["Carlos", "Charlie"],
      #"D" => ["Dara", "David"],
      #"E" => ["Eco", "Etto"]
    #}

    @data = {}
    ("A".."Z").to_a.each do |letter|
      @data[letter] = []
      5.times do
        # Via http://stackoverflow.com/a/88341/910451
        random_string = (0...4).map{65.+(rand(25)).chr}.join
        @data[letter] << letter + random_string
      end
    end
  end

  def tableView(tableView, numberOfRowsInSection: section)
    rows_for_section(section).count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
    cell ||= UITableViewCell.alloc.initWithStyle(
      UITableViewCellStyleDefault,
      reuseIdentifier: @reuseIdentifier
    )
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    cell.textLabel.text = row_for_index_path(indexPath)
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    letter = sections[indexPath.section]

    controller = UIViewController.alloc.initWithNibName(nil, bundle: nil)
    controller.view.backgroundColor = UIColor.whiteColor
    controller.title = letter

    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.text = row_for_index_path(indexPath)
    label.sizeToFit
    label.center = [
      controller.view.frame.size.width / 2,
      controller.view.frame.size.height / 2
    ]
    controller.view.addSubview(label)
    self.navigationController.pushViewController(controller, animated: true)
  end

  def tableView(tableView, titleForHeaderInSection: section)
    sections[section]
  end

  def tableView(tableView, editingStyleForRowAtIndexPath: indexPath)
    UITableViewCellEditingStyleDelete
  end

  def tableView(tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
    if editingStyle == UITableViewCellEditingStyleDelete
      rows_for_section(indexPath.section).delete_at indexPath.row
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimationRight)
    end
  end

  def sectionIndexTitlesForTableView(tableView)
    sections
  end

  def tableView(tableView, sectionForSectionIndexTitle: title, atIndex: index)
    sections.index title
  end

  def sections
    @data.keys.sort
  end

  def rows_for_section(section_index)
    @data[self.sections[section_index]]
  end

  def row_for_index_path(index_path)
    rows_for_section(index_path.section)[index_path.row]
  end

  def numberOfSectionsInTableView(tableView)
    self.sections.count
  end
end
