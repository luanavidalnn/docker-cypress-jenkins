# docker-cypress-jenkins

## Primeiro passo:

- No diretorio do projeto crie uma pasta para armazenar a chave ssh do github
  
  mkdir -p ./jenkins_ssh
  
- Gere a chave dentro desse novo diretorio criado
  
  ssh-keygen -t rsa -b 4096 -f ./jenkins_ssh/id_rsa -N "" -C "jenkins@server"
  
- Gere o known_hosts com o github
  
  ssh-keyscan -t rsa github.com >> ./jenkins_ssh/known_hosts
  
- Atribua as permissões necessárias para o usuário jenkins
  
  sudo chown -R 1000:1000 ./jenkins_ssh
  
  sudo chmod 700 ./jenkins_ssh
  
  sudo chmod 600 ./jenkins_ssh/id_rsa
  
  sudo chmod 644 ./jenkins_ssh/known_hosts

## Segundo passo:

- Execute o docker-compose.yml

  docker compose up -d

## Terceiro passo:

- Acessar o jenkins: Gerenciar Jenkins ---> Nodes
- Em Nodes é necessário criar "Novo nó"
- Em "Novo nó" definir o nome do nó e selecionar "Agente permanente" e "Criar"
- Depois de "Criar" pode-se definir configurações que adequem-se a seu ambiente, bem como um label.
- Após isso você poderá fazer um teste de conexão, onde será liberado uma secret. Essa secret precisa ser copiada e colada no docker-compose.yml no lugar do "TOKEN-AGENT-*"
- Depois do docker-compose.yml salvo com as novas informações de secret, ele precisa ser iniciado para que a conexão dos nós se estabeleça.
