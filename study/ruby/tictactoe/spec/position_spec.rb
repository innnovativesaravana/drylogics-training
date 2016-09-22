describe 'Position' do

  it 'should implement equality' do
    expect(Position.new(1,2)).to eq(Position.new(1, 2))
  end

end