module DHLAPI
  class BaseObject < OpenStruct
    attr_reader :attributes

    def initialize(attributes = {})
      @attributes = attributes
      super to_ostruct(attributes)
    end

    private

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, val| [key.to_s.underscore, to_ostruct(val)] }.to_h)
      elsif obj.is_a?(Array)
        return if obj.empty?

        obj.map { |o| to_ostruct(o) }
      end
    end
  end
end
