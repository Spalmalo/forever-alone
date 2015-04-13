module ForeverAlone
  class Configuration

    DEFAULTS = {
      digest:     Digest::MD5,
      timeout:    1_800,        # 30 minutes
      namespace:  :locks
    }.freeze

    DEFAULTS.keys.each do |key|
      attr_writer key

      define_method key do
        instance_variable_get("@#{ key }") || DEFAULTS.fetch(key)
      end
    end

  end
end