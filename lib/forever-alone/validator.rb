module ForeverAlone
  class Validator

    attr_reader :message, :timeout

    def initialize message, timeout=nil
      @message = message
      @timeout = timeout || ForeverAlone.configuration.timeout
    end

    def unique?
      ForeverAlone.redis.get(key).nil?
    end

    def remember
      ForeverAlone.redis.setex key, timeout, 'foo'
    end

    def ensure
      raise ForeverAlone::MessageIsNotUnique, self.inspect unless unique?
      remember
    end

    def key
      @key ||= generate_key
    end

    private

      def generate_key
        digest = ForeverAlone.configuration.digest.hexdigest message

        [
          ForeverAlone.configuration.namespace,
          digest
        ].join(':')
      end

  end
end