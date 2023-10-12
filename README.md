<header>
  <h2>Sistema de Assaltos para MTA (Multi Theft Auto)</h2>
  <p>
    O Assault System é um sistema de assaltos desenvolvido para o Multi Theft Auto (MTA).
    Este sistema oferece uma maneira dinâmica de realizar assaltos em lojas dentro do jogo.
    Os jogadores podem configurar facilmente as opções do sistema e vinculá-lo a qualquer inventário,
    permitindo uma experiência personalizada de assalto no MTA.
  </p>
</header>

<br/>

<div>
  <h2>Características</h2>
  <ul>
    <li>Configuração Flexível: O sistema é facilmente configurável, com um arquivo de configuração totalmente comentado para facilitar a personalização.</li><br/>
    <li>Vinculação ao Inventário: Pode ser vinculado a qualquer inventário com uma única linha de código.</li><br/>
    <li>Níveis de Procurado: Os jogadores receberão um nível de procurado (estrelas) após realizar o assalto.</li><br/>
    <li>Recompensas Aleatórias: Os jogadores receberão recompensas em dinheiro ou itens no inventário após um assalto bem-sucedido.</li>
  </ul>
</div>

<br/>

<div>
  <h2>Código do Sistema</h2>
  <p>O código do sistema consiste em três partes: server-side, client-side e uma configuração central. Aqui estão alguns detalhes importantes do código:</p>
</div>

<br/>

<div>
  <h2>Configuração</h2>
  <p>O arquivo config inclui várias configurações, como níveis de procurado, a ACL da polícia, atrasos, recompensas e muito mais. Personalize essas configurações de acordo com suas preferências.</p>
</div>

<br/>

<div>
  <h2>Server-side</h2>
  <p>O código server-side lida com a criação de marcadores, blips e objetos para as lojas onde os assaltos ocorrerão. Ele também gerencia a lógica de início e término de um assalto, bem como a notificação das autoridades.</p>
</div>

<br/>

<div>
  <h2>Client-side</h2>
  <p>O código client-side cria uma interface gráfica que mostra o tempo restante no nível de procurado após um assalto. Ele também começa o contador regressivo e remove o nível de procurado após um determinado tempo.</p>
</div>

<br/>

<div>
  <h2>Como Usar</h2>
  <ul>
    <li>Adicione o código server-side e client-side ao seu projeto MTA.</li>
    <li>Configure as opções no arquivo <strong>config</strong> de acordo com as necessidades do seu servidor.</li>
    <li>Personalize a lista de locais de assalto em <strong>robberyLocation</strong> no arquivo server-side.</li>
  </ul>
</div>

<br/>

<div>
  <h2>Exemplo Adicional</h2>
  <p>O sistema pode ser facilmente expandido para incluir mais locais de assalto. Basta seguir o exemplo fornecido no código server-side para adicionar novas lojas.</p>

  <p>Divirta-se implementando este sistema no seu servidor MTA!</p>
</div>
