class AddClassifierPayloadToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :classifier_payload, :jsonb
  end
end
