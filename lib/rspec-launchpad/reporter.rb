require 'rspec/core/formatters/base_formatter'
require 'launchpad/device'

module RSpec
  module Launchpad
    class Reporter < RSpec::Core::Formatters::BaseFormatter
      def initialize(output)
        @x = 0
        @y = 0
        @device = ::Launchpad::Device.new
        clear_all
        super
      end

      def example_passed(example)
        @device.change :grid, :x => @x, :y => @y, :red => :off, :green => :high
        move_to_next_led
      end

      def example_failed(example)
        @device.change :grid, :x => @x, :y => @y, :red => :high, :green => :off
        move_to_next_led
      end

      def example_pending(example)
        @device.change :grid, :x => @x, :y => @y, :red => :high, :green => :high
        move_to_next_led
      end

      def dump_summary(duration, example_count, failure_count, pending_count)
        top_color = if failure_count > 0
          {:red => :high, :green => :off}
        else
          {:red => :off, :green => :high}
        end

        right_color = if pending_count > 0
          {:red => :high, :green => :high}
        else
          top_color
        end

        clear_all

        [:up, :down, :left, :right, :session, :user1, :user2, :mixer].each do |button|
          @device.change button, top_color
        end

        [:scene1, :scene2, :scene3, :scene4, :scene5, :scene6, :scene7, :scene8].each do |button|
          @device.change button, right_color
        end
      end

      private

      def move_to_next_led
        @x += 1
        if @x > 7
          @x = 0
          @y += 1
          if @y > 7
            @x = 0
            @y = 0
            clear_all
          end
        end
      end

      def clear_all
        @device.change_all((0..63).to_a.map { { :red => :off, :green => :off } })
      end
    end
  end
end
