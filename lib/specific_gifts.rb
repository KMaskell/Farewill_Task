# frozen_string_literal: true

def specific_gifts(startIndex, _giftsArray)
  clause_one = 'The specific gifts given by this Will shall be paid free of inheritance tax and other taxes or duties payable as a result of my death and the cost of delivering any gift to a beneficiary or vesting it in them shall be an executorship expense as shall be the cost of the upkeep of the gift until delivery or vesting.'

  [[startIndex, clause_one]]
end
