describe 'Tabelas', :tabs do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/tables' 
      
    end

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
end