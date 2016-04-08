prawn_document(:page_layout => :portrait) do |pdf|
    pdf.move_down(20)

    pdf.font_size 25
    pdf.text 'Transactions'

    pdf.move_down 10
    transactions = @transactions.map do |transaction|
      [
        transaction.transactionable.date,
        transaction.transactionable.amount,
        transaction.transactionable_type,
        transaction.transactionable.creater.name
      ]
    end
    transactions.unshift ["Date", "Amount", "Type", "Transaction By"]

    pdf.font_size 17
    pdf.table transactions
end
