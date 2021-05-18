# frozen_string_literal: true

describe InternalServerError do
  let(:error) { described_class.new(request_id: 'random-id') }

  context 'with #http_status_code' do
    it 'returns the default 500 error' do
      expect(error.http_status_code).to eq(500)
    end
  end

  context 'with #errors_for_response' do
    it 'returns an array of error' do
      expect(error.errors_for_response).to include({
                                                     message: /An error has occurred on the server./,
                                                     code: 990_000
                                                   })
    end
  end
end
