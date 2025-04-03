## Versions :gem:
* **Ruby:** 3.3.1
* **Rails:** 7.1.3

## Configurações :monorail:
1. Execute `bundle install`.
2. Configure `config/database.yml`.
3. Executa `rails db:drop db:create db:migrate db:seed`.
4. Executa `rails s`.

## Docker :whale:

<p>Esta é uma aplicação 100% dockerizada!</p>

#### Instale Docker para Mac
<ul> 
    <li>Instale o Docker Desktop: https://docs.docker.com/desktop/install/mac-install </li> 
</ul>

#### Instale Docker para Linux
<ul> 
    <li>Desinstale o Docker Engine: https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine
    </li> 
    <li>Instale o Docker Engine: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
    </li> 
    <li>Configure o Docker para uso sem usuário root: https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user
    </li> 
    <li>Configure o Docker para iniciar com o sistema: https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot
    </li> 
</ul>

#### Install Docker for Linux
<ul>
    <li>Do you use Windows? I'm sorry, docker doesn't work well on Windows. </li>
</ul>

#### Lembretes do Docker

- Inicie o terminal

- Certifique-se de que as permissões do seu sistema operacional e terminal estão corretas. (Não tenha medo de alterar o shebang se necessário)

- Se você não estiver instalando pela primeira vez, não sobrescreva arquivos

- Se for instalar uma nova gem, sempre lembre-se de reconstruir

- Esta aplicação utiliza uma série de scripts shell para simplificar comandos do Docker e do Rails, todos estão escritos dentro da pasta devops.


### Builda e suba 


```bash
  sh devops/chmod.sh
  ./devops/compose/build.sh --no-cache
  ./devops/compose/up.sh
```

### Comece ou reinicie a DB

```bash
    ./devops/rails/restart.sh
```

### Execute o console de Rails

```bash
    ./devops/rails/console.sh
```

### Update na DB

```bash
    ./devops/rails/update.sh
```

### Desinstale e delete containers

```bash
  ./devops/compose/down.sh
  ./devops/compose/delete.sh
```

## DB reminders

- Se você estiver tendo problemas ao abrir em um sistema de gerenciamento de banco (como Beekeeper, DBeaver, PG Admin, etc.), não esqueça que é necessário rodar o container e usar localhost como host. 
- Se aparecerem problemas com papéis (roles), não hesite em usar ```pkill postgres``` e ```brew services stop postgresql``` (caso esteja usando o Homebrew).
- Se estiver com problemas de usuários acessando o banco, builda novamente o container.

<h2>E é isso! :computer:</h2> 