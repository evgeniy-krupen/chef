control_group 'jenkins' do
  control 'ssh_port' do
    it 'should be listening' do
     expect(port(22)).to be_listening
   end
  end
end
