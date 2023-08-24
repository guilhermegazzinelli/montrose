# frozen_string_literal: true

require "spec_helper"

describe Montrose::Rule::Only do
  let(:dates) { [Date.today, Date.today + 5.days] }
  let(:rule) { Montrose::Rule::Only.new(dates) }

  describe "#include?" do
    it { assert rule.include?(time_now) }
    it { refute rule.include?(time_now + 1.days) }
    it { assert rule.include?(time_now + 5.days) }
    it { refute rule.include?(time_now + 10.days) }
  end

  describe "#continue?" do
    it { refute rule.continue? dates[1]+1.day }
  end
end
