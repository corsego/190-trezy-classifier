require 'csv'

class ImportTransactionsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    file_path = 'test/fixtures/files/transactions-csv.csv'
    opened_file = File.open(file_path)
    options = { headers: true, col_sep: ';' }
    CSV.foreach(opened_file, **options) do |row|
      hash = {}
      hash[:transaction_date] = row['Date'].to_datetime
      hash[:description] = row['Description']
      hash[:amount] = row['Amount']
      hash[:currency] = row['Currency']
      hash[:direction] = row['Type']
      Transaction.find_or_create_by!(hash)
    end
  end
end
