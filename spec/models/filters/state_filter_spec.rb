require "spec_helper"

describe Filters::StateFilter, ".filter" do
  let!(:sp) { State.make!(name: 'São Paulo') }
  let!(:rs) { State.make!(name: 'Rio Grande do Sul') }

  it "returns states ids and names" do
    expect(described_class.filter).to eq([rs, sp])
  end

  it "returns only the ones with jobs" do
    city = City.make! state: sp
    Job.make! city: city
    Job.make! city: city
    expect(described_class.filter(jobs: true)).to eq([sp])
  end
end
