shared_examples "a group container" do
  it 'should allow having no items' do
    group = Group.new
    expect { group.save }.to be_true
  end

  it 'should allow having multiple items' do
    group = Group.new
    group.items << GroupItem.make
    expect { group.save }.to be_true
  end

  it 'should save its own items' do
    group = Group.new
    group.items << GroupItem.make

    expect { group.save! }.to change { GroupItem.count }.by(1)
  end

  describe '#items' do
    it 'should return students and groups' do
      some_student = Student.make!
      some_group = Group.make!

      new_group = Group.new
      new_group.students << some_student
      new_group.groups << some_group
      new_group.save!

      new_group.groupables.should include(some_student)
      new_group.groupables.should include(some_group)
    end
  end
end