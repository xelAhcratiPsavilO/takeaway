# frozen_string_literal: true

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu }
  describe '#show_menu' do
    it 'instructs menu to show list' do
      expect(menu).to receive :list
      takeaway.show_menu
    end
  end
end
