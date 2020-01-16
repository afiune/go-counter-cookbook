#
# Cookbook:: go-counter-cookbook
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'go-counter-cookbook::default' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      stub_command("hab svc status afiune/go-counter").and_return("")
      expect { chef_run }.to_not raise_error
    end
  end
end
