require 'spec_helper'

describe Timesheet do
  it "should lock optimistically" do
    t1 = Timesheet.create
    t2 = Timesheet.find(t1.id)

    t1.rate = 250
    t2.rate = 175

    t1.save.should be_true
    #t2.save.should be_true
    expect { t2.save}.to raise_error(ActiveRecord::StaleObjectError)
  end

  it "should pass transactional update" do
    Timesheet.transaction do
      t1 = Timesheet.create
      t2 = Timesheet.create
      t1.rate=220
      t2.rate=232
    end
  end
end
