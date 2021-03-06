# frozen_string_literal: true

def specific_gifts(start_index, gifts_array)
  return [] if gifts_array == []

  clause_one = 'The specific gifts given by this Will shall be paid free of inheritance tax and other taxes or duties payable as a result of my death and the cost of delivering any gift to a beneficiary or vesting it in them shall be an executorship expense as shall be the cost of the upkeep of the gift until delivery or vesting.'

  clause_two = 'Any item that fails to pass to a beneficiary will return to my estate to be included in the residue of my estate.'

  clause_three = gifts_array.map do |all_beneficiaries|
    beneficiaries = all_beneficiaries[:beneficiaries]
    'I give to ' + beneficiaries.map { |beneficiary| "#{beneficiary[:name].split.map(&:capitalize).join(' ')} of #{beneficiary[:identifier]}" }.join(' and ') +
      " my '#{all_beneficiaries[:name]}'"
  end .join('. ') + '.'

  [[start_index, clause_one], [start_index + 1, clause_two], [start_index + 2, clause_three]]
end
