describe 'Upload', :upload do
    before(:each) do

        visit 'https://training-wheels-protocol.herokuapp.com/upload' 
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/Thalita.jpg'
    end

    #Por enquanto nao faz upload de arquivos no Firefox

    it 'upload com arquivo texto' do  
       #puts @arquivo
       attach_file('file-upload', @arquivo)
       click_button 'Upload'

       div_arquivo = find('#uploaded-file')
       expect(div_arquivo.text).to eql 'arquivo.txt'
    end   

    it 'upload com imagem', :upload_imagem do  
        #puts @arquivo
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        img = find('#new-image')
        #include siginifica contenha o arquivo 
        expect(img[:src]).to include '/uploads/Thalita.jpg'
     end   

#No terminal usar o comando "cat Caminho do arquivo" para mostrar na tela o conteudo do arquivo texto
#Conferir caminho do arquivo

    after(:each) do
        sleep 3 
    end
end