require 'spec_helper'
require 'omniauth-Windowslive'

describe OmniAuth::Strategies::Windowslive do
  subject do
    OmniAuth::Strategies::Windowslive.new(nil, @options || {})
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'should have the correct Windowslive site' do
      subject.client.site.should eq("https://launchpad.Windowslive.com")
    end

    it 'should have the correct authorization url' do
      subject.client.options[:authorize_url].should eq("/authorization/new")
    end

    it 'should have the correct token url' do
      subject.client.options[:token_url].should eq('/authorization/token')
    end
  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      subject.callback_path.should eq('/auth/Windowslive/callback')
    end
  end
end
