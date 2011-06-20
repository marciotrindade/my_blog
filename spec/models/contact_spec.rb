require 'spec_helper'

describe Contact do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:body) }
  end

end
