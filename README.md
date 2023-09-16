# README

Projeto criado com base em https://github.com/zanfranceschi/rinha-de-backend-2023-q3/blob/main/INSTRUCOES.md

Deploy disponível em  https://rinha-backend-production.up.railway.app/

Requisitos técnicos:

- [x] Criação de 4 endpoints

- [x] POST /pessoas – para criar um recurso pessoa.
- [x] GET /pessoas/[:id] – para consultar um recurso criado com a requisição anterior.
- [x] GET /pessoas?t=[:termo da busca] – para fazer uma busca por pessoas.
    - Dado o termo da busca, a resposta deverá ser uma lista que satisfaça o termo informado estar contido nos atributos apelido, nome, e/ou elementos de stack. A busca não precisa ser paginada e poderá retornar apenas os 50 primeiros registros resultantes da filtragem para facilitar a implementação.

    - O status code deverá ser sempre 200 - Ok, mesmo para o caso da busca não retornar resultados (vazio).
- [x] GET /contagem-pessoas – endpoint especial para contagem de pessoas cadastradas.
- [x] Criação de Pessoas
`POST /pessoas`

Deverá aceitar uma requisição em formato JSON com os seguintes parâmetros:

| atributo | descrição |
| --- | --- |
| **apelido** | obrigatório, único, string de até 32 caracteres. |
| **nome** | obrigatório, string de até 100 caracteres. |
| **nascimento** | obrigatório, string para data no formato AAAA-MM-DD (ano, mês, dia). |
| **stack** | opcional, vetor de string com cada elemento sendo obrigatório e de até 32 caracteres. |
-Receber dados no seguinte formato: 
  ```json
  {
    "nickname" : "p1234",
    "name" : "paulo Roberto",
    "birth_date" : "2000-10-01",
    "stack" : ["C#", "Node", "Oracle"]
}
```
- [x] Usar postgree como banco
- [X] Fazer deploy

- [ ] Implementar docker
- [ ] Usar UUID (preferencialmente ULID)



# Observações do projeto

Os dados foram armazenadas em duas tabelas: stacks e people. Uma pessoa pode ter várias stacks, logo um relacionamento 1:N.

Uma melhoria possível: Estabelecer que o relacionamento seja N:N. Assim, guardaríamos uma lisa de pessoas, uma lista de stacks e uma entidade com o relacionamento entre elas.

Para evitar acessar o banco de dados diretamente no controller, foi criado services. A ideia é que a medida que sejam nessárias regras de negócio, os services tornem-se funcionais. Assim, alteramos apenas os services e não os controllers.



