describe 'IDs Dinamicos', :ids_dinamicos do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access' 
      
    end

    it 'cadastro' do  
        # Utilizando expressao regular com "*" signifca que termina com a expressao a seguir
        find('input[id$=UsernameInput]').set 'Thalita'
        # Utilizando expressao regular com "^" signifca que começa com a expressao a seguir
        find('input[id^=PasswordInput').set '123456'
        # Utilizando expressao regular com "*" signifca que contem a expressao a seguir
        # O "a" significa que é um link , por que parece um botao , mas é um link
        find('a[id*=GetStartedButton]').click

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end   
end
