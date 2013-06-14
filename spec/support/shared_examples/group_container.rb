shared_examples "a group container" do
  it 'should allow having no items' do
    group = SchoolGroup.new
    expect { group.save }.to be_true
  end

  it 'should allow having multiple items' do
    group = SchoolGroup.new
    group.items << SchoolGroupItem.make
    expect { group.save }.to be_true
  end

  it 'should save its own items' do
    group = SchoolGroup.new
    group.items << SchoolGroupItem.make

    expect { group.save! }.to change { SchoolGroupItem.count }.by(1)
  end

  describe '#items' do
    it 'should return students and groups' do
      some_student = Student.make!
      some_group = SchoolGroup.make!

      new_group = SchoolGroup.new
      new_group.students << some_student
      new_group.groups << some_group
      new_group.save!

      expect { new_group.groupables }.to include(some_student)
      expect { new_group.groupables }.to include(some_group)
    end
  end
end