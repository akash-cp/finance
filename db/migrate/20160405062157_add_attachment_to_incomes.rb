class AddAttachmentToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :attachment, :string
  end
end
