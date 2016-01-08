require 'spec_helper'

describe 'webupd8_oracle_java' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { should compile }
    end
  end
end