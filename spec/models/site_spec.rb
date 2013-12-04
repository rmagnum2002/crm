require 'spec_helper'

describe Site do
  it 'should create site' do
    s = Site.new({host: 'team.crm.tld', name: 'Team site'}, as: :admin)
    expect(s).to be_valid
  end
end
