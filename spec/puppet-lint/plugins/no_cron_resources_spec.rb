require 'spec_helper'

describe 'no_cron_resources' do
  let(:msg) { 'cron resources should not be used' }

  context 'catalogfile with out cron resources' do
    let(:code) do
      <<-TEST_CLASS
        class file_resource {
          file { '/tmp/my-file':
            mode => '0600',
          }
        }
      TEST_CLASS
    end

    it 'should not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'catalogfile with cron resources' do
    let(:code) do
      <<-TEST_CLASS
        class cron_resource {
          cron { 'logrotate':
            command => '/usr/sbin/logrotate',
            user    => root,
            hour    => 2,
            minute  => 0,
          }
        }
      TEST_CLASS
    end

    it 'should detect a single problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a warning' do
      expect(problems).to contain_warning(msg).on_line(2).in_column(11)
    end
  end
end
