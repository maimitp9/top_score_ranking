# frozen_string_literal: true

class ErrorCodes
  # Base error codes
  BASE_NOT_FOUND_ERROR = 120_000
  BASE_SERVER_ERROR_OTHERS = 990_000
  BASE_VALIDATION_ERROR_CLIENT = 200_000

  # Routing / 404
  NO_ROUTING = BASE_NOT_FOUND_ERROR + 1
end
