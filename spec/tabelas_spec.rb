describe 'Tabelas', :tabs do
    
    before(:each) do
        visit '/tables' 
      
    end

    #console 
    #$('table tbody tr') -> Retorna todos os dados das TRS

    it 'pega o Tony Stark na lista' do  
        expect(page).to have_content 'Robert Downey Jr'
    end   

    it 'deve exibir o salario do stark' do  
        atores = all('table tbody tr')

        stark = atores.detect {|ator| ator.text.include?('Robert Downey Jr')}
        puts stark.text

        expect(stark.text).to include '$ 10.000.000'
    end  

    it 'deve exibir salario do Vin Diesel' do  
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000.000'
    end  
    
    it 'deve exibir o filme Velozes e Furiosos' do  
        diesel = find('table tbody tr', text: '@vindiesel')

        movie = diesel.all('td')[2].text
 
        expect(movie).to eql 'Velozes e Furiosos'
    end  

    it 'deve exibir o insta do Chris Evans' do  
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text

        expect(insta).to eql '@teamcevans'
        puts insta
    end  

    it 'deve selecionar Chris Pratt para remoção' do  
       pratt = find('table tbody tr', text: 'Chris Pratt')
       pratt.find('a', text: 'delete').click

       msg = page.driver.browser.switch_to.alert.text
       expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end  

    it 'deve selecionar Chris Pratt para edição' do  
        pratt = find('table tbody tr', text: 'Chris Pratt')
        pratt.find('a', text: 'edit').click
 
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
     end  
end