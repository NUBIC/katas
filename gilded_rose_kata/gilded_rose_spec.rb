# require 'gilded_rose'
require 'gilded_rose_solution'

describe "#update_quality" do

  context "with a single" do
    let(:initial_sell_in) { 5 }
    let(:initial_quality) { 10 }
    let(:item) { Item.new(name, initial_sell_in, initial_quality) }

    before(:each) { update_quality([item]) }

    context "normal item" do
      let(:name) { "NORMAL ITEM" }

      context "before sell date" do
        it "should decrement quality by one" do
          item.quality.should == initial_quality - 1
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
      end

      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "should decrement quality by two" do
          item.quality.should == initial_quality - 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
      end

      context "after sell date" do
        let(:initial_sell_in) { -10 }
        it "should decrement quality by two" do
          item.quality.should == initial_quality - 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
      end

      context "of zero quality" do
        let(:initial_quality) { 0 }
        it "should not change in quality" do
          item.quality.should == 0
        end
      end
    end

    context "Aged Brie" do
      let(:name) { "Aged Brie" }
  
      context "before sell date" do
        it "should increment quality by one" do
          item.quality.should == initial_quality + 1
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
    
        context "with max quality" do
          let(:initial_quality) { 50 }
          
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
          it "should decrement sell_in by one" do
            item.sell_in.should == initial_sell_in - 1
          end
        end
      end
  
      context "on sell date" do
        let(:initial_sell_in) { 0 }
        
        it "should increment quality by two" do
          item.quality.should == initial_quality + 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
  
        context "with max quality" do
          let(:initial_quality) { 50 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
          it "should decrement sell_in by one" do
            item.sell_in.should == initial_sell_in - 1
          end
        end
      end
  
      context "after sell date" do
        let(:initial_sell_in) { -10 }
        it "should increment quality by two" do
          item.quality.should == initial_quality + 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
  
        context "with max quality" do
          let(:initial_quality) { 50 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
          it "should decrement sell_in by one" do
            item.sell_in.should == initial_sell_in - 1
          end
        end
      end
    end
  
    context "Sulfuras" do
      let(:initial_quality) { 80 }
      let(:name) { "Sulfuras, Hand of Ragnaros" }
  
      context "before sell date" do
        it "should not change in quality" do
          item.quality.should == initial_quality
        end
        it "should not change sell_in number of days" do
          item.sell_in.should == initial_sell_in
        end
      end
  
      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "should not change in quality" do
          item.quality.should == initial_quality
        end
        it "should not change sell_in number of days" do
          item.sell_in.should == initial_sell_in
        end
      end
  
      context "after sell date" do
        let(:initial_sell_in) { -10 }
        it "should not change in quality" do
          item.quality.should == initial_quality
        end
        it "should not change sell_in number of days" do
          item.sell_in.should == initial_sell_in
        end
      end
    end
  
    context "Backstage pass" do
      let(:name) { "Backstage passes to a TAFKAL80ETC concert" }
  
      context "long before sell date" do
        let(:initial_sell_in) { 11 }
        it "should increment quality by one" do
          item.quality.should == initial_quality + 1
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
  
        context "at max quality" do
          let(:initial_quality) { 50 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
        end
      end
  
      context "medium close to sell date (upper bound)" do
        let(:initial_sell_in) { 10 }
        it "should increment quality by two" do
          item.quality.should == initial_quality + 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
  
        context "at max quality" do
          let(:initial_quality) { 50 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
        end
      end
  
      context "medium close to sell date (lower bound)" do
        let(:initial_sell_in) { 6 }
        it "should increment quality by two" do
          item.quality.should == initial_quality + 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end

        context "at max quality" do
          let(:initial_quality) { 50 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
        end
      end
  
      context "very close to sell date (upper bound)" do
        let(:initial_sell_in) { 5 }
        it "should increment quality by three" do
          item.quality.should == initial_quality + 3
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end

        context "at max quality" do
          let(:initial_quality) { 50 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
        end
      end
  
      context "very close to sell date (lower bound)" do
        let(:initial_sell_in) { 1 }
        it "should increment quality by three" do
          item.quality.should == initial_quality + 3
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end

        context "at max quality" do
          let(:initial_quality) { 50 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
        end
      end
  
      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "should have a quality of 0" do
          item.quality.should == 0
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
      end
  
      context "after sell date" do
        let(:initial_sell_in) { -10 }
        it "should have a quality of 0" do
          item.quality.should == 0
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
      end
    end
  
    context "conjured item" do
      before { pending }
      let(:name) { "Conjured Mana Cake" }
  
      context "before the sell date" do
        let(:initial_sell_in) { 5 }
        it "should decrement quality by two" do
          item.quality.should == initial_quality - 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
  
        context "at zero quality" do
          let(:initial_quality) { 0 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
        end
      end
  
      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "should decrement quality by two" do
          item.quality.should == initial_quality - 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
  
        context "at zero quality" do
          let(:initial_quality) { 0 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
        end
      end
  
      context "after sell date" do
        let(:initial_sell_in) { -10 }
        it "should decrement quality by two" do
          item.quality.should == initial_quality - 2
        end
        it "should decrement sell_in by one" do
          item.sell_in.should == initial_sell_in - 1
        end
  
        context "at zero quality" do
          let(:initial_quality) { 0 }
          it "should not change in quality" do
            item.quality.should == initial_quality
          end
        end
      end
    end
  
  end
  
  context "with several objects" do
    let(:items) { [Item.new("NORMAL ITEM", 5, 10),Item.new("Aged Brie", 3, 10)] }
  
    before(:each) do
      update_quality(items)
    end

    it "should update the quality and sell by date of each" do
      items[0].quality.should == 9
      items[0].sell_in.should == 4
      
      items[1].quality.should == 11
      items[1].sell_in.should == 2
    end
  end
end
