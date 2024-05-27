# Desafio técnico - Ruby on Rails

para rodar o projeto dentro da pasta do projeto rode esse comando:

```
docker compose build
```

E depois

```
docker compose up
```

Se for a primeira vez abrindo o projeto talvez tenha que criar o banco de dados, então entre no terminal do docker com o comando:

```
docker compose exec web sh
```

Em seguida para criar o banco 

```
rails db:create
```

e depois para subir todas as tabelas:

```
rails db:migrate
```

## O sistema

No sistema de votação existem 3 tabelas a "participants" para os participantes, a "poll" para a votação, e "votes" para os votos dos usuarios

para criar um usuario envie essa requisição para POST: "localhost:3000/participant" com essa formato

```
{
	"participant": {
		"name": "nome do participant"
	}
}
```

O participante pode ter uma foto para isso acesse algum aplicativo para administrar o banco de dados e na coluna picture coloque um foto convertida para base64 e salve

Para criar um poll que é basicamente a votação precisa ter no minimo 2 participantes e enviar um POST: 

```
{
	"poll": {
		"first_participant_id": 3,
		"second_participant_id": 2
	}
}
```

Pronto, agora podemos acessar o as paginas web no outro repositorio;

Para não usarem robos para fazer os votos coloquei um limite de requisições com a gem RackAttack que limita a 6 requisiçoes por ip 
