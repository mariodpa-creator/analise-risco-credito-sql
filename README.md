Projeto de Análise de Risco de Crédito - Home Credit

O objetivo principal deste projeto é analisar dados de solicitações de empréstimos para prever e mitigar o risco de inadimplência de clientes.

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** SQL Server
* **Ferramenta de Desenvolvimento:** SQL Server Management Studio (SSMS)
* **Fonte dos Dados:** [Home Credit Default Risk (Kaggle)](https://kaggle.com)

## 📁 Estrutura do Repositório
O projeto está organizado em três etapas lógicas para facilitar a avaliação:

* **`1-carga-dados/`**: Contém os scripts responsáveis pela criação das tabelas e importação dos arquivos originais do Kaggle para o ambiente SQL Server.
* **`limpeza e integridade dos dados/`**: Scripts dedicados ao tratamento de valores nulos, remoção de duplicadas, padronização de colunas e identificação e tratamento dos outlies.
* **`Análise dos dados/`**: Consultas SQL (queries) focadas em responder às perguntas de negócio, histórico de créditos anteriores, perfil e comportamento financeiro dos clientes.

## 📈 Principais Insights Obtidos
*Clientes com vendas cruzadas tendem a ser aprovados 
<img width="673" height="65" alt="image" src="https://github.com/user-attachments/assets/e0d20a68-7e55-4265-8ed4-97604ccfd666" />

*Para clientes novos o índice de reprovação é menor
<img width="670" height="62" alt="image" src="https://github.com/user-attachments/assets/2738a1fd-c052-47a6-a894-8ccb90b71578" />

*clientes com 3 ou mais contratos de créditos interno e externos têm uma taxa de inadimplência maior
<img width="690" height="58" alt="image" src="https://github.com/user-attachments/assets/94a8d5d1-7a88-4ba4-a0ba-7b1b7bd06b8e" />

*Clientes abaixo de 40 anos apresentam maior taxa de inadimplên<img width="587" height="120" alt="image" src="https://github.com/user-attachments/assets/ec274ed2-10ad-4746-8b73-d546ce7d95c8" />
cia.
<img width="491" height="120" alt="image" src="https://github.com/user-attachments/assets/98509e04-6a1b-4175-a31f-84f09723c6f4" />

*Há uma correlação inversa entre estabilidade profissional e inadimplência: com mais de 3 créditos, a taxa cai de 14,36% (menos de 2 anos de emprego) para 8,94% (mais de 5 anos); com 3 ou menos créditos, recua de 10,70% para 5,46%."
<img width="777" height="158" alt="image" src="https://github.com/user-attachments/assets/dc5139b9-4d9e-4528-b53e-6abd548c0eb4" />

*A análise indica uma correlação inversa entre a posse de patrimônio e o risco de crédito. O maior índice de inadimplência concentra-se no grupo economicamente mais vulnerável (sem carro e sem casa, com 8,99%). Em contrapartida, a posse de veículo atua como o principal fator atenuante, reduzindo a taxa para os menores patamares registrados: 7,33% (com casa) e 7,04% (sem casa).
<img width="635" height="100" alt="image" src="https://github.com/user-attachments/assets/cd531539-1dc1-46e2-a1d2-dee6c14730b5" />

*Há uma correlação inversa entre o nível educacional e a inadimplência: o risco máximo está na baixa escolaridade (Lower secondary) com 12,57%, enquanto o ensino superior (Higher education) reduz as taxas para os menores patamares, variando de 5,96% a 4,09%.

<img width="587" height="120" alt="image" src="https://github.com/user-attachments/assets/e489d3ce-e750-4e6a-9403-8ab4920063c0" />
<img width="592" height="77" alt="image" src="https://github.com/user-attachments/assets/9e7cf3c2-a426-49a8-8ac0-f20bd30c58d6" />

*O risco de inadimplência varia drasticamente entre as modalidades, atingindo o pico em Microloan (20,64%) e os menores índices em Car loan (5,57%) e Mortgage (5,00%).

<img width="572" height="51" alt="image" src="https://github.com/user-attachments/assets/2d78af89-23f0-4b84-b917-5c6f530d2454" />
<img width="567" height="56" alt="image" src="https://github.com/user-attachments/assets/9df6f804-a055-471a-86cc-2ef516b57461" />




## 👨‍💻 Autor: Mário Augusto da Silva
      Email: mario.dpa@gmail.com
* **Seu Nome Completo** - [Seu Link do LinkedIn ou Email de Contato]
