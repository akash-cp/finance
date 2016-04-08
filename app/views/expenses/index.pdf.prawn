prawn_document(:page_layout => :portrait) do |pdf|
    pdf.move_down(20)

    pdf.font_size 25
    pdf.text 'Expenses'

    pdf.move_down 10
    expenses = @expenses.map do |expense|
      [
        expense.date,
        expense.amount,
        expense.expense_category.name,
        expense.creater.name,
        expense.updater.name
      ]
    end
    expenses.unshift ["Date", "Amount", "Category", "Created_by", "Updated_by"]

    pdf.font_size 15
    pdf.table expenses
end
