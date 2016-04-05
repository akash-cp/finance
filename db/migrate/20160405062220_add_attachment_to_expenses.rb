class AddAttachmentToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :attachment, :string
  end
end
