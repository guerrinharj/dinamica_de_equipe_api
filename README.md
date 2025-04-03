# DINAMICA DE EQUIPE API

Essa é uma API que desenvolvi como parte de um desafio para a Gigalink. Trata-se de uma API que gerencia dinâmicas de equipe e permite avaliações (reviews) sobre elas.


## Models


### Dinamica

- O model ```Dinamica``` representa uma dinâmica de equipe dentro da aplicação. Cada dinâmica pode ser avaliada por meio de ```reviews``` e também possui registros de alteração (```logs```).
- Ao excluir uma ```Dinamica```, todos os ```reviews``` associados também serão excluídos automaticamente.
- O campo ```nome``` da dinâmica é obrigatório.
- O campo ```descricao``` da dinâmica também é obrigatório.
- O campo ```participantes``` é um array de strings com nomes dos participantes armazenado diretamente na tabela ```dinamicas```.
- Calculamos a média das notas das avaliações associadas à dinâmica
- Caso não haja ```reviews``` o valor retornado é ```null``



### Review

- O model ```Review``` representa uma avaliação feita sobre uma ```dinâmica``` de equipe. Cada ```review``` contém uma ```nota``` e um ```comentário``` a respeito da experiência na dinâmica.
- Ao excluir uma ```Dinamica```, todos os ```reviews``` e ```logs``` associados também serão excluídos automaticamente.
- O campo ```comentario``` é obrigatório. Isso garante que cada avaliação tenha um texto descritivo.
- O campo ```nota``` também é obrigatório e deve estar dentro do intervalo de 1 a 5.



## Routes

### ```GET /api/dinamicas```

- Retorna todas as ```dinâmicas``` cadastradas.
- Inclui os campos ```id```, ```nome```, ```descricao```, ```participantes```, ```avaliacao_media``` e os ```reviews``` associados.


**Request:**
```bash
curl --location 'http://localhost:3000/api/dinamicas'
```

**200 Response:**
```json
[
    {
        "id": 1,
        "nome": "Tempestade de Ideias",
        "descricao": "Dinâmica para gerar ideias em grupo.",
        "participantes": ["Ana", "Bruno", "Carla"],
        "avaliacao_media": 4.5,
        "reviews": ['...']
    }
]
```

### ```GET /api/dinamicas/:id```

- Retorna os dados de uma ```dinâmica``` específica.
- Inclui ```participantes```, ```avaliações``` e ```nota média```.




**Request:**
```bash
curl --location 'http://localhost:3000/api/dinamicas/1'
```

**200 Response:**
```json
{
    "id": 1,
    "nome": "Tempestade de Ideias",
    "descricao": "Dinâmica para gerar ideias em grupo.",
    "participantes": ["Ana", "Bruno", "Carla"],
    "avaliacao_media": 4.5,
    "reviews": [...]
}
```


### ```POST /api/dinamicas```

- Cria uma nova ```dinâmica``` com participantes.
- Exige os campos ```nome```, ```descricao``` e ```participantes``` (array de strings).


**Request:**
```bash
curl --location 'http://localhost:3000/api/dinamicas' \
--header 'Content-Type: application/json' \
--data '{
  "dinamica": {
    "nome": "Nova Dinâmica",
    "descricao": "Descrição de teste",
    "participantes": ["João", "Maria"]
  }
}'

```

**200 Response:**
```json
{
    "id": 5,
    "nome": "Nova Dinâmica",
    "descricao": "Descrição de teste",
    "participantes": ["João", "Maria"],
    "created_at": "2025-04-03T18:05:21.112Z",
    "updated_at": "2025-04-03T18:05:21.112Z"
}
```


### ```PATCH /api/dinamicas/:id```

- Atualiza os dados de uma ```dinâmica``` existente.
- Pode alterar ```nome```, ```descrição``` ou lista de ```participantes```.

**Request:**
```bash
curl --location --request PATCH 'http://localhost:3000/api/dinamicas/1' \
--header 'Content-Type: application/json' \
--data '{
  "dinamica": {
    "nome": "Dinâmica Atualizada",
    "participantes": ["Pedro", "Laura"]
  }
}'
```

**200 Response:**
```json
{
    "id": 1,
    "nome": "Dinâmica Atualizada",
    "descricao": "Dinâmica para gerar ideias em grupo.",
    "participantes": ["Pedro", "Laura"]
}
```


### ```DELETE /api/dinamicas/:id```

- Remove uma ```dinâmica``` do sistema.


**Request:**
```bash
curl --location --request DELETE 'http://localhost:3000/api/dinamicas/1'
```

**200 Response:**
Sem conteúdo.
```json
```



### ```GET /api/dinamicas/aleatoria```

- Retorna uma ```dinâmica``` aleatória do banco de dados.


**Request:**
```bash
curl --location 'http://localhost:3000/api/dinamicas/aleatoria'
```

**200 Response:**
```json
{
    "id": 3,
    "nome": "Quebra-Gelo",
    "descricao": "Dinâmica leve para introdução entre participantes.",
    "participantes": ["Gabriel", "Helena", "Isabela"],
    "avaliacao_media": 4.0,
    "reviews": [...]
}
```



### ```POST /api/dinamicas/:dinamica_id/reviews```

- Cria uma nova avaliação (```review```) para a ```dinâmica``` especificada.
- Requer os campos ```comentario``` e ```nota``` (de 1 a 5).


**Request:**
```bash
curl --location --request POST 'http://localhost:3000/api/dinamicas/1/reviews' \
--header 'Content-Type: application/json' \
--data '{
  "review": {
    "comentario": "Muito boa!",
    "nota": 5
  }
}'

```

**200 Response:**
```json
{
    "id": 7,
    "dinamica_id": 1,
    "comentario": "Muito boa!",
    "nota": 5,
    "created_at": "2025-04-03T18:07:10.321Z"
}

```



### ```GET /api/participantes```

- Retorna uma lista de todos os nomes de ```participantes``` já cadastrados em qualquer ```dinâmica```.
- Os nomes são únicos, ordenados em ordem alfabética e vêm do array de cada dinâmica.


**Request:**
```bash
curl --location 'http://localhost:3000/api/participantes'
```

**200 Response:**
```json
["Ana", "Bruno", "Carla", "Daniel", "Eduarda", "Felipe", "Gabriel", "Helena", "Isabela", "João", "Laura", "Maria", "Pedro"]
```


## Redis

- Usamos Redis como sistema de cache. Ele armazena dados temporariamente para que o sistema não precise consultar o banco de dados tradicional (PostgreSQL) com tanta frequência, melhorando a performance da API.

- A aplicação usa um container Redis isolado, definido no ```docker-compose.yml```.

- A porta padrão ```6379``` é exposta para que a aplicação Rails possa se conectar.


## TDD

- Este projeto segue a prática de TDD (Test-Driven Development), utilizando ```RSpec``` (framework de testes) e ```FactoryBot``` (ferramenta para criar objetos de teste de forma limpa e reutilizável.)


## Versões :gem:
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