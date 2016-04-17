# frozen_string_literal: true

module Seteable
  def self.included(base)
    base.include(InstanceMethods)
    base.extend(ClassMethods)
  end

  def self.deepclone(hash)
    default_proc = hash.default_proc
    hash.default_proc = nil

    Marshal.load(Marshal.dump(hash))
  ensure
    hash.default_proc = default_proc
  end

  module ClassMethods
    def inherited(subclass)
      subclass.settings.replace(Seteable.deepclone(settings))
      subclass.settings.default_proc = proc { |h, k| h[k] = settings[k] }
    end

    def settings
      @settings ||= {}
    end

    def set(key, value)
      settings[key] = value
    end
  end

  module InstanceMethods
    def settings
      self.class.settings
    end
  end
end
