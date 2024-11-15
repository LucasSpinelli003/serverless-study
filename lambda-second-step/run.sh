#install 
npm i -g serverless

#sls inicializar

sls

# sempre fazer um deploy do ambiente antes de tudo para verificar se está com o ambiente ok

sls deploy

#chamar a lambda na aws

sls invoke -f <function_name>

# chamar a lambda local

sls invoke local -f <function_name>


# ficar escutando uma lambda e seus logs

sls logs -f <function_name> --tail