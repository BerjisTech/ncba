# frozen_string_literal: true

RSpec.describe Ncba do
  it "has a version number" do
    expect(Ncba::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(Ncba.Resource).to eq(true)
  end
end
