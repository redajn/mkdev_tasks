# frozen_string_literal: true

RSpec.shared_examples 'query events by state' do |state|
  it "return #{state} events" do
    expect(described_class.new(
      Event.all,
      { state: state }
    ).call).to match_array(send("#{state}_event"))
  end
end
