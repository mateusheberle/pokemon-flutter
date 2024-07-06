/* Login

arquivos:
lib
  |- Common
    |- Components
    |- Model
      |- user_model.dart

  |- Home
    |- Controller
    |- Page
      |- home_page.dart

  |- Login
    |- Components
      |- login_fields.dart
      |- login_image.dart
      |- keep_logged_in.dart
      |- sign_in.dart
    |- Controller
      |- login_controller.dart
    |- Page
      |- login_page.dart
  
  |- main.dart


pasta Common - consumido por mais de uma feature
arquivos em comum com outras pastas

Placeholder() - widget de teste, tela preta com um 'X'

extrait widget 
- selecionar widget (sem a vígula final)
- ctrl + .
- 'extract widget'
- criar novo arquivo
- recortar o widget para o novo arquivo
- fazer importações necessárias
    
  
user_modal.dart
- criar classe 'UserModel'
- criar atributos (nome, sobrenome, apelido, senha)
- selecionar algum atributo
- ctrl + .
- 'Generate data class'


pushNamedAndRemoveUntil - dar push e remover todos pra trás
Navigator.of(context).pushNamedAndRemoveUntil(
                        '/homePage', (Route<dynamic> rote) => false);
false - remove todas as rotas anteriores

*/