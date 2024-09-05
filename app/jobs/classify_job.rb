class ClassifyJob < ApplicationJob
  queue_as :default

  def perform(transaction)
    response = Faraday.post('https://classify.trezy.io/api/v1/bank_transactions/classify') do |req|
      req.headers['accept'] = 'application/json'
      req.headers['Authorization'] = 'Bearer MySecretToken'
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        label: transaction.description,
        amount: transaction.amount,
        country: 'FR',
        language: 'fr'
      }.to_json
    end

    transaction.update!(classifier_payload: response.body)
  end
end
