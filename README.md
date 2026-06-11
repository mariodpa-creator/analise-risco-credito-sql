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

*Clientes abaixo de 40 anos apresentam maior taxa de inadimplência.
<img width="491" height="120" alt="image" src="https://github.com/user-attachments/assets/98509e04-6a1b-4175-a31f-84f09723c6f4" />






*(Dica: Escreva aqui de 2 a 3 descobertas legais que você fez nas suas queries. Exemplos abaixo para você se inspirar e trocar pelos seus reais)*
* **Idade vs Inadimplência:** Clientes mais jovens apresentaram uma taxa de atraso X% maior do que clientes acima de 40 anos.
* **Tipo de Contrato:** O modelo de crédito "Revolving loans" teve um índice de risco menor se comparado a "Cash loans".
* **Histórico Interno:** Clientes com histórico de recusas anteriores no banco possuem uma tendência Y% maior de atrasar o novo pagamento.

## 👨‍💻 Autor
* **Seu Nome Completo** - [Seu Link do LinkedIn ou Email de Contato]
