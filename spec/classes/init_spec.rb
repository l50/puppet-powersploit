require 'spec_helper'
describe 'debianfirefox' do

  context 'with defaults for all parameters' do
    it { should contain_class('debianfirefox') }
  end
end
