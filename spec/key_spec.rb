describe 'Teclado', :key do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/key_presses' 
      
    end

    # it 'enviando tecla SPACE' do  
    #     find('#campo-id').send_keys :space

    #     expect(page).to have_content 'You entered: SPACE'
    # end   

    # it 'enviando tecla TAB' do  
    #     find('#campo-id').send_keys :tab

    #     expect(page).to have_content 'You entered: TAB'
    # end   
  
    # it 'enviando teclas' do  
    #     teclas = %i[tab escape enter shift control alt]

    #     teclas.each do |t|
    #      find('#campo-id').send_keys t
    #      expect(page).to have_content 'You entered: ' + t.to_s.upcase
    #     end   
    # end  

    it 'enviando letras' do  
        letras = %w[a s d f g h j k l]
        letras.each do |l|
            find('#campo-id').send_keys l   
            expect(page).to have_content 'You entered: ' + l.to_s.upcase
        end
    end 

     sleep 2 
    
end