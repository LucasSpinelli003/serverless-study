# -First politicas de segurança

# -Second criar a role de segurança IAM 
aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log

# -Thirth criar arquivo com conteúdo e zipa-lo
zip function.zip index.js

# -Fourth criar a lambda
aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::160885259826:role/lambda-exemplo \
    | tee logs/lambda-create.log


#Fifth invocar a lambda

aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log


#Atualizar, zipar
zip function.zip index.js

aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/update-function.log

# remover os recursos

aws lambda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name lambda-exemplo