# frozen_string_literal: true

require 'rails_helper'

describe ApplicationError do
  let!(:error) { ApplicationError.new }

  context '#http_status_code' do
    it 'return the default 500 error' do
      expect(error.http_status_code).to eq(500)
    end
  end

  context '#errors_for_response' do
    it 'raises a NotImplementedError' do
      expect{
        error.errors_for_response
      }.to raise_error(NotImplementedError, /You must implement/)
    end
  end

  context '#error_logs' do
    it 'build the logs from exception' do
      exception = StandardError.new('test')
      exception.set_backtrace([])

      expect(error.error_logs(exception)).to eq('ApplicationError: StandardError: "test": ')
    end
  end
end