module Seteable
  def self.included(base)
    base.extend(ClassMethods)
  end

  def self.deepclone(obj)
    return Marshal.load(Marshal.dump(obj))
  end

  def settings
    return self.class.settings
  end

  module ClassMethods
    def inherited(subclass)
      subclass.settings.replace(Seteable.deepclone(settings))
    end

    def settings
      return @settings ||= {}
    end
  end
end
