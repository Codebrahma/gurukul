class ApiError < StandardError
  attr_accessor :error_code, :message_params
  def initialize(error_code)
    @error_code = error_code
    @message_params = ApiError.messages[@error_code]
  end

  def error_hash
    {
      :code => error_code,
      :message => message_params
    }
  end

  private
  def self.codes
    {
      :INVALID_OBJECT                            => 400,
      :UNKNOWN                                   => 500,
      :NO_ACTIVE_USER_SESSION                    => 5001,
      :INVALID_LOGIN_CREDENTIALS                 => 5002,
      :UNAUTHORIZED                              => 9001
    }
  end

  def self.messages
    {
      400  => "Invalid object",
      500  => "Internal server error",
      5001 => "No active user session",
      5002 => "Username and password doesn't match",
      9001 => "Request unauthorized, Can't access this resource"
    }
  end
end
