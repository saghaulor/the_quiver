class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      payload[:iat] = Time.now.to_i
      payload[:jti] = SecureRandom.uuid.tr('-', '')
      JWT.encode(payload, signing_key, 'HS256')
    end

    def decode(token)
      body = JWT.decode(token, signing_key)[0]
      HashWithIndifferentAccess.new body
    rescue
      # we don't need to raise errors, just return nil if JWT is invalid or expired
      nil
    end

    def signing_key
      Rails.application.secrets.secret_key_base
    end
  end
end

