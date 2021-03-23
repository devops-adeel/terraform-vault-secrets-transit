#!/usr/bin/env ruby
#
# -*- mode: ruby -*-
# vi: set ft=ruby :
#

content = inspec.profile.file('terraform.json')
params = JSON.parse(content)

token           = params['token']['value']
url             = params['url']['value']
namespace       = params['namespace']['value']
encrypt         = params['encryption_endpoint']['value']
decrypt         = params['decryption_endpoint']['value']
encoded_data    = params['encoded_data']['value']
ciphertext      = params['ciphertext']['value']

encrypt_payload = JSON.generate({:plaintext => "#{encoded_data}"})
decrypt_payload = JSON.generate({:ciphertext => "#{ciphertext}"})


title 'Vault Integration Test'

control 'vlt-1.0' do
  impact 0.7
  title 'Test access to encrypting data'
  desc 'Test access encrypting data'
  describe http("#{url}/v1/#{namespace}#{encrypt}",
              method: 'POST',
              data: encrypt_payload.to_s,
              headers: {'X-Vault-Token' => "#{token}"}) do
    its('status') { should eq 200 }
  end
end

control 'vlt-2.0' do
  impact 0.7
  title 'Test access to encrypting data'
  desc 'Test access encrypting data'
  describe http("#{url}/v1/#{namespace}#{decrypt}",
              method: 'POST',
              data: decrypt_payload.to_s,
              headers: {'X-Vault-Token' => "#{token}"}) do
    its('status') { should eq 200 }
  end
end

control 'vlt-3.0' do
  impact 0.7
  title 'Test health'
  desc 'Test health'
  describe http("#{url}/v1/sys/health?perfstandbyok=true",
              method: 'GET') do
    its('status') { should eq 200 }
  end
end
