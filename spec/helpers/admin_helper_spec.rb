require 'spec_helper'

describe AdminHelper do

  it "data_table should add a js tag" do
    helper.data_table
    helper.content_for(:js).should =~ /text\/javascript/
    helper.content_for(:js).should =~ /dataTable/
    helper.content_for(:js).should =~ /sPaginationType/
    helper.content_for(:js).should =~ /bStateSave/
    helper.content_for(:js).should =~ /bInfo/
    helper.content_for(:js).should =~ /iDisplayLength/
    helper.content_for(:js).should =~ /aaSorting/
  end

end
