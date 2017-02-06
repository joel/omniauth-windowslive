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
      expect(subject.client.site).to eq('https://login.live.com')
    end

    it 'should have the correct authorization url' do
      expect(subject.client.options[:authorize_url]).to eq('/oauth20_authorize.srf')
    end

    it 'should have the correct token url' do
      expect(subject.client.options[:token_url]).to eq('/oauth20_token.srf')
    end
  end

  describe '#callback' do
    let(:callback_url) { '/auth/windowslive/callback' }

    describe '#callback_path' do
      it 'should have the correct callback path' do
        expect(subject.callback_path).to eq(callback_url)
      end
    end

    describe '#callback_url' do
      before { expect(subject).to receive(:query_string) { '?key=value' } }

      it 'should remove query string from callback url' do
        expect(subject.send(:callback_url)).to eq(callback_url)
      end
    end
  end
end
