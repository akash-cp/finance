prawn_document(:page_layout => :portrait) do |pdf|
    pdf.move_down(20)

    pdf.font_size 25
    pdf.text 'Incomes'

    pdf.move_down 10
    incomes = @incomes.map do |income|
      [
        income.date,
        income.amount,
        income.income_category.name,
        income.creater.name,
        income.updater.name
      ]
    end
    incomes.unshift ["Date", "Amount", "Category", "Created_by", "Updated_by"]

    pdf.font_size 17
    pdf.table incomes
end
