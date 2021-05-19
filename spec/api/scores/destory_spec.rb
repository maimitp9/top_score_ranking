# frozen_string_literal: true

require 'api_helper'

resource 'Scores' do
  explanation 'Create, read & delete scores'

  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let!(:score) { create(:score) }

  delete '/api/scores/:id' do
    let(:id) { score.id }

    context 'with 200 status' do
      # rubocop:disable RSpec/MultipleExpectations
      example 'Deleting an score' do
        expect do
          do_request
        end.to change(Score, :count).by(-1)

        expect(status).to eq(200)
      end
      # rubocop:enable RSpec/MultipleExpectations
    end
  end
end
