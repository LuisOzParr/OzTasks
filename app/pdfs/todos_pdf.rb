class TodosPdf < Prawn::Document
  def initialize (todo)
    super(top_margin: 70)
    @todo = todo
    text "#{@todo.title}", size: 25, style: :bold
    text "#{@todo.description}", size: 15
    line_items
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
    end
  end

  def line_item_rows
    [["Title", "Description"]] +
      @todo.tasks.map do |item|
        [item.title, item.description]
      end
  end

end