require 'spec_helper'

describe OmniAuth::Strategies::Windowslive do
  subject do
    OmniAuth::Strategies::Windowslive.new(nil, @options || {}).tap do |strategy|
      strategy.instance_variable_set(:@env, {})
    end
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'should have the correct Windowslive site' do
      subject.client.site.should eq("https://login.live.com")
    end

    it 'should have the correct authorization url' do
      subject.client.options[:authorize_url].should eq("/oauth20_authorize.srf")
    end

    it 'should have the correct token url' do
      subject.client.options[:token_url].should eq('/oauth20_token.srf')
    end
  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      subject.callback_path.should eq('/auth/windowslive/callback')
    end
  end

  describe '#callback_url' do
    it 'should remove query string from callback url' do
      subject.stub(:query_string) {'?key=value'}
      subject.send(:callback_url).should_not end_with(subject.query_string)
    end
  end
end
