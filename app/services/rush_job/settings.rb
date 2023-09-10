module RushJob
  class Settings
    RUSH_JOB_SETTINGS = {
      theme: %w[light dark],
      editing: %w[disabled enabled]
    }.freeze

    def self.change_setting(setting, value)
      return unless RUSH_JOB_SETTINGS[setting.to_sym]

      if RUSH_JOB_SETTINGS[setting.to_sym][1] == value
        RUSH_JOB_SETTINGS[setting.to_sym][0]
      else
        RUSH_JOB_SETTINGS[setting.to_sym][1]
      end
    end
  end
end
