# Sistema de Ordem de Serviço

Aplicação desktop para cadastro e acompanhamento de clientes e ordens de serviço.

## Tecnologias

- Delphi 10.3.2
- Firebird 4.0
- FireDAC para acesso aos dados
- FastReport 6.9 para relatórios

## Funcionalidades implementadas

- Cadastro, edição, exclusão e pesquisa de clientes.
- Criação e edição de ordens de serviço vinculadas a clientes.
- Inclusão de itens na OS, com quantidade, valor unitário e subtotal.
- Pesquisa de OS por período de abertura, status, parte do nome do cliente e faixa de valor.
- Indicadores de OS abertas, em andamento, concluídas e em atraso.
- Destaque visual de OS atrasadas e aviso de dias de atraso na edição.
- Relatórios filtráveis, agrupados por status, com contagens e somas, exportáveis para PDF e CSV.

## Organização do projeto

- `src/Forms`: formulários da aplicação.
- `src/Data`: conexão FireDAC e acesso aos dados.
- `Reports/relatorioOS.fr3`: modelo do relatório FastReport.
- `banco de dados/SISTEMAORDEMDESERVIÇO.FDB`: arquivo de banco de dados fornecido.
- `SistemaOS.dpr` e `SistemaOS.dproj`: arquivos do projeto Delphi.

## Configuração do banco de dados

O projeto utiliza Firebird 4.0 por meio do driver FireDAC `FB`. A conexão está configurada no componente `FDConexao`, em `src/Data/uDM_Conexao.dfm`. Ajuste o parâmetro `Database` para o caminho do arquivo `.FDB` no computador em que o sistema será executado. O caminho atual é específico do computador de desenvolvimento.

Parâmetros usados pela conexão:

```ini
DriverID=FB
Database=<caminho local para o arquivo .FDB>
User_Name=<usuário do Firebird>
Password=<senha configurada localmente>
CharacterSet=UTF8
```

Configure a senha localmente no Delphi e evite publicar credenciais reais em repositórios ou neste arquivo.

O arquivo `.FDB` está incluído no projeto. Não foi localizado um script SQL de criação das tabelas, índices e da view `VW_OS_RESUMO`; portanto, para recriar o banco do zero, será necessário preparar esse script ou fornecer um banco previamente criado.

## Como abrir e executar

1. Instale o Delphi 10.3.2, o Firebird 4.0 e os componentes FastReport 6.9 compatíveis com o Delphi.
2. Confirme que a biblioteca cliente do Firebird (`fbclient.dll`) está disponível para a aplicação.
3. Ajuste o caminho do banco em `src/Data/uDM_Conexao.dfm`.
4. Abra `SistemaOS.dproj` no Delphi.
5. Selecione a plataforma/configuração desejada, compile e execute.

O relatório externo deve permanecer em `Reports/relatorioOS.fr3`. A configuração atual do projeto gera o executável em `Win32/Debug`; para a entrega da prova, coloque o executável compilado na pasta `bin/`, conforme solicitado no enunciado.

## Como verificar o cálculo de SLA/atraso

1. Crie uma OS com data prevista anterior à data atual e status `Aberta` ou `Em Andamento`.
2. Inclua ao menos um item e salve a OS.
3. Na pesquisa, confira o destaque da OS e o contador de atrasos no painel.
4. Abra a OS para verificar o aviso com os dias de atraso.
5. Altere o status para `Concluída` ou `Cancelada` e confira se ela deixa de ser considerada atrasada.

O cálculo de atraso utiliza a view `VW_OS_RESUMO` do banco. A view precisa existir no arquivo `.FDB` utilizado.

## Decisões de arquitetura

- A interface está separada em formulários na pasta `src/Forms`.
- Consultas e operações de persistência estão organizadas em DataModules na pasta `src/Data`.
- O acesso ao banco é feito com consultas FireDAC parametrizadas.
- A gravação da OS e de seus itens é agrupada em uma transação.
- O FastReport utiliza o modelo externo `.fr3`, mantido na pasta `Reports`.

## Limitações conhecidas

- A exclusão de OS existe no DataModule, mas ainda não está ligada a uma ação da interface.
- O total dos itens é recalculado e mostrado no formulário; a gravação do total na coluna `VALOR_TOTAL` deve ser confirmada no banco, pois não foi encontrada no código uma atualização explícita desse campo.
- Não foi localizada a atualização de `DATA_FECHAMENTO` ao concluir uma OS.
- Os erros são apresentados em mensagens na tela; não há gravação em arquivo de log.
- O botão `Processar Atrasos`, se mantido na interface, ainda precisa de uma rotina associada.
- O caminho do banco está configurado localmente e precisa ser ajustado em outro computador.

## Uso de inteligência artificial

Ferramentas de inteligência artificial foram usadas como apoio na análise do projeto, na correção da localização do arquivo do relatório FastReport e na orientação sobre expressões do relatório. O candidato deve revisar, adaptar e compreender o código entregue.
