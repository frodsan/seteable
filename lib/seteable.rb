module Seteable
  def self.included(base)
    base.include(InstanceMethods)
    base.extend(ClassMethods)
  end

  def self.deepclone(hash)
    default_proc, hash.default_proc = hash.default_proc, nil

    return Marshal.load(Marshal.dump(hash))
  ensure
    hash.default_proc = default_proc
  end

  module InstanceMethods
    def settings
      return self.class.settings
    end
  end

  module ClassMethods
    def inherited(subclass)
      subclass.settings.replace(Seteable.deepclone(settings))
      subclass.settings.default_proc = proc { |h, k| h[k] = settings[k] }
    end

    def settings
      return @settings ||= {}
    end
  end
end
