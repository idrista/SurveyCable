class Session < ApplicationRecord
  after_create :add_slug

  private
    def add_slug
      self.slug = generate_slug(self.id)
      save
    end

    def generate_slug(number)
      variation = number / 1000 * 0x123456
      result = (number ^ 0x5F3759DF) + 0x7ED55D
      result = (result * 0xA5B7) % 0xFFFF
      result += variation

      result.to_s(16)
    end
end
