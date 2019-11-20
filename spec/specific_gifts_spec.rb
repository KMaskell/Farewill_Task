# frozen_string_literal: true

require 'specific_gifts'

index = 1
gift_array_simple = [
  {
    name: 'Crocs',
    beneficiaries: [
      {
        name: 'Daniel Garrett',
        identifier: 'dan@farewill.com'
      }
    ]
  }
]

clause_one = 'The specific gifts given by this Will shall be paid free of inheritance tax and other taxes or duties payable as a result of my death and the cost of delivering any gift to a beneficiary or vesting it in them shall be an executorship expense as shall be the cost of the upkeep of the gift until delivery or vesting.'

describe 'with a single gift for a single beneficiary' do
  it 'adds the first 2 standard clauses to the returned array' do
    expect(specific_gifts(index, gift_array_simple)[0]).to eq([1, clause_one])
  end
end
