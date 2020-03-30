


describe 'Caixa de opções'  do
    it 'item especifico simples' do
        visit '/dropdown'    
        #Buscar elemento por id 
        select('Steve Rogers', from: 'dropdown') 
        sleep 3
    end   

    it 'item especifico com o find' do
        visit '/dropdown'  
        #Buscar elemento por cssselector  
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
        sleep 3
    end  

    it 'qualquer item', :dropdown do
        visit '/dropdown'  
        #Buscar elemento por cssselector  
        drop = find('.avenger-list')
        #sample faz o sorteio de um elemento no array
        drop.all('option').sample.select_option
    end  

end