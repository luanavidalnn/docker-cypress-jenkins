# docker-cypress-jenkins

## Primeiro passo:

- No diretorio do projeto crie uma pasta para armazenar a chave ssh do github
  
  mkdir -p ./jenkins-ssh
  
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
