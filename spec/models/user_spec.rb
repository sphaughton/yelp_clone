require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many :restaurants }

  it { is_expected.to have_many :reviewed_restaurants }
  
end