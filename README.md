# Pokedex Franq

# Arquitetura
Foi feito o uso do Clean Architeture para a organização em camadas do projeto,
seguindo sempre o SOLID para o design do código.

# Dificuldades
Por eu ter feito a escolha de um projeto bem estruturado 
para demonstrar os conhecimentos que possuo tive menos tempo
para finalizar a versão aprimorada. (Comecei o projeto no dia 13 de Janeiro á noite)

- Faltando implementar:  
    - Update e Delete do Pokemon Custom
    - Logs para contabilizar usando Analytics
    - Tela de Login

# Pacotes utilizados
- Dio: Requisições HTTP
- path: Facilitar uso de caminhos locais do device
- fpdart: Utilização do Either
- get_it: Injenção de Dependencia
- sqflite: Banco de Dados local
- injectable: Facilitar o uso do get_it
- flutter_svg: Utilizar imagens em SVG
- image_picker: Utilizado para pegar imagens do device do usuario
- flutter_bloc: Gerenciamento de Estado
- flutter_modular: Modular para facilitar a navegação
- pull_to_refresh: Facilitar a implementação da lista infinita
- palette_generator: Para pegar a cor dominante da imagem
- cached_network_image: Cachear na memoria as imagens carregadas

# Comandos
## Build Runner
```flutter packages pub run build_runner build --delete-conflicting-outputs```  
```flutter packages pub run build_runner watch --delete-conflicting-outputs```

# Estrutura

├── lib  
│   ├── app  
│   │   ├── core  
│   │   │   ├── enums  
│   │   │   ├── injectable  
│   │   │   ├── routes  
│   │   │   ├── translate  
│   │   │   └── utils  
│   │   ├── feature  
│   │   │   └── {some_page}  
│   │   │       ├── data  
│   │   │       │   ├── datasource  
│   │   │       │   ├── model  
│   │   │       │   └── repository  
│   │   │       ├── domain  
│   │   │       │   ├── entity  
│   │   │       │   ├── repository  
│   │   │       │   └── usecase  
│   │   │       └── presenter  
│   │   │           ├── store  
│   │   │           └── pages  
│   │   └── layout  
│   │       ├── components  
│   │       └── themes  
│   │           ├── colors  
│   │           ├── icons  
│   │           └── images  
│   ├── main_dependencies.dart  
│   └── main.dart  
├── pubspec.lock  
└── pubspec.yaml  
