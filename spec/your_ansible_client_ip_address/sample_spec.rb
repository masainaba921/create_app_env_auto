require 'spec_helper'

db_user = "your_user_name"
db_password = "your_password"
db_host = "your_rds_endpoint"
db_name = "your_app_name"

describe command("mysqlshow -u #{db_user} -h #{db_host} -p#{db_password} #{db_name}" ) do
    its(:stdout) { should contain("#{db_name}").from("Database:") }
end


describe service('nginx') do
    it { should be_running }
end

describe command("ps aux | grep unicorn" ) do
    its(:stdout) { should contain("unicorn_rails master") }
end

describe port(80) do
    it { should be_listening }
end


