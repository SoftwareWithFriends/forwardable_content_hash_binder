require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe ForwardableContentHashBinder do
  let(:timestamp) { DateTime.parse("2007-01-31").to_time.to_i }

  let(:content_hash) {
        {"body"  => "I am a short body.",
         "title" => "I am a very long title relative to the body.",
         "meta"  => {"timestamp" => timestamp }
        }
  }

  let(:document_content) {ForwardableContentHashBinder.new(content_hash)}

  it "should delegate to content hash" do
      content_hash["body"].should  == document_content.body
      content_hash["title"].should == document_content.title
      content_hash["meta"]["timestamp"].should  ==  document_content.meta["timestamp"]
  end

  it "should raise when hash does not contain key" do
    expect { document_content.stock_ticker_information }.to raise_error NoMethodError
  end

  it "should call proc" do
    a = 0
    content_hash["proc"] = lambda {a += 1; "I'm #{a} handsome blocke!" }
    document_content.proc.should == "I'm 1 handsome blocke!"
    document_content.proc.should == "I'm 2 handsome blocke!"
  end

  it "should allow assignment" do
   field = "Test data"
   document_content["test"] = field

   document_content.test.should == field
  end

end

