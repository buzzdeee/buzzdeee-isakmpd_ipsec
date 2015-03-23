require 'spec_helper'
describe 'isakmpd_ipsec' do

  context 'with defaults for all parameters' do
    it { should contain_class('isakmpd_ipsec') }
  end
end
