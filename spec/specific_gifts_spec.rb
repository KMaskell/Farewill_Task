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

clause_two = 'Any item that fails to pass to a beneficiary will return to my estate to be included in the residue of my estate.'

describe 'with a single gift for a single beneficiary' do
  it 'adds the first 2 standard clauses to the returned array' do
    expect(specific_gifts(index, gift_array_simple)[0]).to eq([1, clause_one])
    expect(specific_gifts(index, gift_array_simple)[1]).to eq([2, clause_two])
  end

  it 'returns the correct format for the gifts clause' do
    expect(specific_gifts(index, gift_array_simple)[2]).to eq([3, "I give to Daniel Garrett of dan@farewill.com my 'Crocs'."])
  end
end

describe 'with a non-capitalised name' do
  index = 1
  gift_array_non_capitalised = [
    {
      name: 'Crocs',
      beneficiaries: [
        {
          name: 'daniel garrett',
          identifier: 'dan@farewill.com'
        }
      ]
    }
  ]

  it 'returns the name capitalised in the specific gifts string' do
    expect(specific_gifts(index, gift_array_non_capitalised)[2]).to eq([3, "I give to Daniel Garrett of dan@farewill.com my 'Crocs'."])
  end
end
