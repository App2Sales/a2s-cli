# Bootstrap React-Native

Script para criar novos projetos em React-Native. 

# Uso

Clone o projeto: 

```Shell
git clone https://github.com/App2Sales/a2s-cli
``` 

Execute o script: 

```Shell
bash /<path_to_scrip>/a2s-cli/reactNativeBootstrap.sh <option> <NAME>
``` 

|Parâmetro|Descrição|Requerido|
|---------|---------|---------|
|option|Uma das seguintes opções: <br/> init - inicializa o projeto <br/> screen - cria uma nova screen  <br/> component - cria um novo component <br/> container - cria um novo container  | true| 
|name| Nome do projeto, screen, component ou container a ser criado | true|

# Alias

Para sua conveniência recomendamos o uso de alias

```Shell
alias a2sinit='bash {YOUR_DIRECTORY/a2s-cli.sh init $*'
alias a2scomponent='bash {YOUR_DIRECTORY/a2s-cli.sh component $*'
alias a2sscreen='bash {YOUR_DIRECTORY/a2s-cli.sh screen $*'
alias a2scontainer='bash {YOUR_DIRECTORY/a2s-cli.sh container $*'
```