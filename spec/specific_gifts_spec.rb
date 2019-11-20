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

describe 'with a different start index' do
  big_index = 11
  very_big_index = 212
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

  it 'returns the correct indexes for a larger given start index' do
    expect(specific_gifts(big_index, gift_array_simple)[0][0]).to eq(11)
    expect(specific_gifts(big_index, gift_array_simple)[2][0]).to eq(13)
    expect(specific_gifts(very_big_index, gift_array_simple)[0][0]).to eq(212)
    expect(specific_gifts(very_big_index, gift_array_simple)[2][0]).to eq(214)
  end
end

describe 'when given no specific gift data' do
  index = 1
  gift_array_empty = []

  it 'returns an empty array if there are no gifts' do
    expect(specific_gifts(index, gift_array_empty).length).to eq(0)
  end
end

describe 'with multiple beneficiaries for a gift' do
  index = 1
  gift_array_multiple_beneficiaries = [
    {
      name: 'Watch',
      beneficiaries: [
        {
          name: 'Zac Colley',
          identifier: 'zac@farewill.com'
        },
        {
          name: 'Helena Thompson',
          identifier: 'helena@farewill.com'
        },
        {
          name: 'Tom Rogers',
          identifier: 'tom@farewill.com'
        },
        {
          name: 'Kat Maskell',
          identifier: 'kat@farewill.com'
        }
      ]
    }
  ]
  expected_string = "I give to Zac Colley of zac@farewill.com and Helena Thompson of helena@farewill.com and Tom Rogers of tom@farewill.com and Kat Maskell of kat@farewill.com my 'Watch'."

  it "returns an 'and' seperated list in the gift text for multiple beneficiaries" do
    expect(specific_gifts(index, gift_array_multiple_beneficiaries)[2]).to eq([3, expected_string])
  end
end

describe 'with multiple gifts' do
  index = 1
  gift_array_multiple_gifts = [
    {
      name: 'Watch',
      beneficiaries: [
        {
          name: 'Zac Colley',
          identifier: 'zac@farewill.com'
        },
        {
          name: 'Helena Thompson',
          identifier: 'helena@farewill.com'
        },
        {
          name: 'Tom Rogers',
          identifier: 'tom@farewill.com'
        }
      ]
    },
    {
      name: 'Shorts',
      beneficiaries: [
        {
          name: 'Jacob Pargin',
          identifier: 'jacob.pargin@farewill.com'
        }
      ]
    }
  ]
  expected_string = "I give to Zac Colley of zac@farewill.com and Helena Thompson of helena@farewill.com and Tom Rogers of tom@farewill.com my 'Watch'. I give to Jacob Pargin of jacob.pargin@farewill.com my 'Shorts'."
  it 'returns a single string for the third clause describing all of the specific gifts' do
    expect(specific_gifts(index, gift_array_multiple_gifts)[2]).to eq([3, expected_string])
  end
end
