describe 'caixas de seleção' , :check do
    before(:each) do
        visit '/checkboxes' 
    end
#Check e uncheck funcionam para Id e Name
    it 'marcando uma opção' do
        check('thor')
    end

    it 'desmarcando uma opção' do
        uncheck('antman')
    end

    after(:each) do
        sleep 3
    end

    it 'marcando com find set true' do
        find('input[value=cap]').set(true)
    end

    it 'marcando com find set false' do
        find('input[value=cap]').set(false)
    end
end