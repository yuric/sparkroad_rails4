shared_examples "a groupable item" do
  it 'should allow students to be associated' do
    expect {
      subject.student = Student.make!
      subject.save!
    }.to_not raise_error
  end

  it 'should allow groups to be associated' do
    expect {
      subject.group = SchoolGroup.make!
      subject.save!
    }.to_not raise_error
  end

  it 'should not allow group and student at the same time' do
    expect {
      subject.group = SchoolGroup.make!
      subject.student = Student.make!
      subject.save!
    }.to raise_error ActiveRecord::RecordInvalid
  end
end