# == Schema Information
#
# Table name: camps
#
#  id         :bigint(8)        not null, primary key
#  is_current :boolean
#  name       :string
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Camp, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
