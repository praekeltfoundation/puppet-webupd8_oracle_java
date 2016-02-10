require 'spec_helper'

describe 'webupd8_oracle_java' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile }
      it { is_expected.to contain_class('apt') }
      it { is_expected.to contain_apt__ppa('ppa:webupd8team/java') }

      describe 'with default parameters' do
        it do
          is_expected.to contain_file('/var/cache/debconf/oracle-java8-installer.preseed')
            .with_ensure('present')
            .with_content('oracle-java8-installer shared/accepted-oracle-license-v1-1 select true')
        end

        it do
          is_expected.to contain_package('oracle-java8-installer')
            .with_ensure('installed')
            .with_responsefile('/var/cache/debconf/oracle-java8-installer.preseed')
            .that_requires([
              'File[/var/cache/debconf/oracle-java8-installer.preseed]',
              'Apt::Ppa[ppa:webupd8team/java]',
              'Class[apt::update]',
            ])
        end
      end

      describe 'when ensure is purged' do
        let(:params) { { :ensure => 'purged' } }
        it do
          is_expected.to contain_package('oracle-java8-installer')
            .with_ensure('purged')
        end
      end

      describe 'when version is 9' do
        let(:params) { { :version => '9' } }
        it do
          is_expected.to contain_file('/var/cache/debconf/oracle-java9-installer.preseed')
            .with_ensure('present')
            .with_content('oracle-java9-installer shared/accepted-oracle-license-v1-1 select true')

          is_expected.to contain_package('oracle-java9-installer')
            .with_ensure('installed')
            .with_responsefile('/var/cache/debconf/oracle-java9-installer.preseed')
            .that_requires([
              'File[/var/cache/debconf/oracle-java9-installer.preseed]',
              'Apt::Ppa[ppa:webupd8team/java]',
              'Class[apt::update]',
            ])
          end
      end
    end
  end
end
