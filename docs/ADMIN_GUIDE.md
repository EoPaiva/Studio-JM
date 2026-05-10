<<<<<<< HEAD
=======
<<<<<<< HEAD
# Guia do Painel Administrativo — Studio JM

Este documento explica como utilizar o **Admin Engine** do Studio JM para gerenciar projetos, briefings, imagens, conteúdos e avisos exibidos no site.

---

## 1. Acesso ao Painel

O painel administrativo é protegido por login via **Supabase Auth**.

Para acessar:

1. Abra a página de login do painel administrativo.
2. Informe o e-mail e a senha cadastrados no Supabase.
3. Após o login, o sistema redirecionará para o dashboard administrativo.

> Apenas usuários autenticados conseguem acessar as áreas internas do painel.

---

## 2. Dashboard

O dashboard é a área inicial do painel.

Ele pode exibir informações como:

- Últimos briefings recebidos;
- Projetos cadastrados;
- Projetos publicados;
- Novidades ativas;
- Atalhos para criação de novos conteúdos.

O objetivo do dashboard é oferecer uma visão rápida da operação do site.

---

## 3. Gestão de Briefings

A área de briefings reúne as solicitações enviadas pelos clientes pelo formulário do site.

Cada briefing pode conter:

- Nome do cliente;
- E-mail;
- Telefone;
- Tipo de projeto;
- Mensagem ou descrição da necessidade;
- Referências ou anexos enviados;
- Data de envio;
- Status de acompanhamento.

### Como analisar um briefing

1. Acesse a área **Briefings**.
2. Clique no briefing desejado.
3. Leia as informações enviadas pelo cliente.
4. Abra os anexos, se houver.
5. Entre em contato pelo telefone, e-mail ou WhatsApp informado.

### Status sugeridos

Os briefings podem ser organizados com status como:

```txt
Novo
Em análise
Respondido
Convertido
Arquivado
```

---

## 4. Gestão de Projetos

A área de projetos controla o portfólio exibido no site.

Um projeto pode ser cadastrado como **rascunho** ou **publicado**.

### Criar um novo projeto

1. Acesse **Projetos**.
2. Clique em **Novo Projeto**.
3. Preencha as informações principais.
4. Envie a imagem de capa.
5. Envie as imagens da galeria.
6. Preencha o memorial ou descrição técnica.
7. Defina se o projeto ficará visível no site.
8. Salve as alterações.

---

## 5. Campos de um Projeto

Ao cadastrar um projeto, preencha os campos com atenção.

| Campo | Descrição |
| :--- | :--- |
| **Título** | Nome público do projeto. |
| **Categoria** | Tipo do projeto, como residencial, comercial ou interiores. |
| **Área** | Metragem aproximada do projeto. |
| **Status da Obra** | Situação atual, como conceito, em andamento ou concluído. |
| **Descrição Curta** | Texto resumido para apresentação inicial. |
| **Memorial Técnico** | Texto detalhado do projeto. |
| **Imagem de Capa** | Imagem principal exibida no portfólio. |
| **Galeria** | Conjunto de imagens internas do projeto. |
| **Visibilidade** | Define se o projeto aparece ou não no site. |

---

## 6. Upload de Imagens

O painel permite enviar imagens para o Supabase Storage.

### Recomendações para imagens

Use imagens:

- Em formato `.jpg`, `.png` ou `.webp`;
- Com boa resolução;
- Otimizadas para web;
- Com nomes simples, sem acentos ou caracteres especiais.

Exemplo recomendado:

```txt
casa-contemporanea-fachada.webp
apartamento-minimalista-sala.jpg
projeto-comercial-recepcao.png
```

Evite nomes como:

```txt
Imagem WhatsApp 2025-01-12 às 14.32.10.jpeg
FOTO FINAL!!! versão nova.png
```

---

## 7. Editor de Texto Rico

O memorial técnico do projeto utiliza um editor de texto rico.

Ele pode ser usado para inserir:

- Títulos;
- Subtítulos;
- Parágrafos;
- Listas;
- Destaques;
- Informações técnicas;
- Descrições de materiais;
- Conceito arquitetônico.

### Boa prática de escrita

Mantenha os textos claros, profissionais e objetivos.

Exemplo:

```txt
O projeto foi desenvolvido com foco na integração dos ambientes sociais, iluminação natural e uso de materiais de baixa manutenção. A composição combina tons neutros, madeira natural e elementos metálicos para criar uma atmosfera contemporânea e acolhedora.
```

---

## 8. Publicar ou Salvar como Rascunho

Ao finalizar um projeto, defina sua visibilidade.

### Rascunho

Use quando o projeto ainda está incompleto ou em revisão.

```txt
visivel = false
```

### Publicado

Use quando o projeto já pode aparecer no site.

```txt
visivel = true
```

Antes de publicar, revise:

- Título;
- Texto;
- Imagem de capa;
- Galeria;
- Categoria;
- Status;
- Ortografia;
- Visualização no site.

---

## 9. Gestão de Novidades e Avisos

A área de novidades controla mensagens exibidas no site, como comunicados, destaques ou chamadas importantes.

Cada novidade pode conter:

- Título;
- Mensagem;
- Link opcional;
- Status ativo ou inativo.

### Criar uma novidade

1. Acesse **Novidades** ou **Avisos**.
2. Clique em **Nova Novidade**.
3. Preencha título e mensagem.
4. Adicione um link, se necessário.
5. Marque como ativa.
6. Salve.

### Exemplos de uso

```txt
Novo projeto residencial publicado.
Agenda aberta para novos briefings.
Studio JM apresenta nova linha de interiores contemporâneos.
```

---

## 10. Editar Conteúdos Existentes

Para editar um conteúdo:

1. Acesse a seção correspondente.
2. Selecione o item desejado.
3. Faça as alterações.
4. Salve.
5. Confira o resultado no site público.

Sempre revise o site após alterações importantes.

---

## 11. Excluir Conteúdos

A exclusão deve ser usada com cuidado.

Antes de excluir um projeto, briefing ou novidade, confirme se o conteúdo realmente não será mais necessário.

Quando possível, prefira:

- Desativar uma novidade;
- Salvar um projeto como rascunho;
- Arquivar um briefing.

---

## 12. Checklist antes de Publicar um Projeto

Antes de tornar um projeto visível no site, confira:

- [ ] O título está correto.
- [ ] A categoria foi preenchida.
- [ ] A imagem de capa foi enviada.
- [ ] A galeria possui imagens de qualidade.
- [ ] O memorial técnico foi revisado.
- [ ] O texto não possui erros de digitação.
- [ ] O projeto está marcado como visível.
- [ ] O projeto aparece corretamente no site público.

---

## 13. Problemas Comuns

### Não consigo fazer login

Verifique se:

- O usuário existe no Supabase Auth;
- O e-mail está correto;
- A senha está correta;
- O projeto está usando a URL e a anon key corretas do Supabase.

---

### O projeto não aparece no site

Verifique se:

- O projeto está salvo;
- A opção de visibilidade está ativa;
- A imagem de capa foi enviada corretamente;
- As permissões de leitura da tabela `projetos` estão configuradas;
- O site foi recarregado após a alteração.

---

### A imagem não carrega

Verifique se:

- O upload foi concluído;
- O bucket `portfolio` existe;
- A imagem está em formato permitido;
- O arquivo não ultrapassa o limite de tamanho;
- A URL da imagem foi salva corretamente no banco.

---

### Os briefings não aparecem no painel

Verifique se:

- O formulário público está enviando os dados;
- A tabela `briefings` existe;
- O usuário está logado;
- As políticas RLS permitem leitura para usuários autenticados.

---

## 14. Boas Práticas

- Use imagens otimizadas para web.
- Evite textos muito longos na descrição curta.
- Mantenha nomes de arquivos organizados.
- Revise os projetos antes de publicar.
- Não compartilhe dados de acesso do painel.
- Não exponha chaves sensíveis do Supabase.
- Faça testes após alterações importantes.

---

## 15. Estrutura Recomendada de Uso

Fluxo ideal para publicar um projeto:

```txt
1. Separar imagens finais
2. Otimizar arquivos
3. Criar projeto no painel
4. Enviar capa
5. Enviar galeria
6. Escrever memorial técnico
7. Salvar como rascunho
8. Revisar visualmente
9. Publicar no site
```

---

## 16. Observação sobre Permissões

Neste projeto, qualquer usuário autenticado no Supabase é tratado como administrador.

Para uma versão mais avançada, recomenda-se criar níveis de acesso, como:

```txt
admin
editor
viewer
```

Assim, diferentes usuários podem ter permissões específicas dentro do painel.

---

## Conclusão

O Admin Engine foi desenvolvido para permitir que o Studio JM gerencie seu conteúdo de forma independente, sem necessidade de editar diretamente o código do site.

=======
>>>>>>> 077e0bed6b95e2e11fa2429325bf8f2e6a96a9f8
# Guia do Painel Administrativo — Studio JM

Este documento explica como utilizar o **Admin Engine** do Studio JM para gerenciar projetos, briefings, imagens, conteúdos e avisos exibidos no site.

---

## 1. Acesso ao Painel

O painel administrativo é protegido por login via **Supabase Auth**.

Para acessar:

1. Abra a página de login do painel administrativo.
2. Informe o e-mail e a senha cadastrados no Supabase.
3. Após o login, o sistema redirecionará para o dashboard administrativo.

> Apenas usuários autenticados conseguem acessar as áreas internas do painel.

---

## 2. Dashboard

O dashboard é a área inicial do painel.

Ele pode exibir informações como:

- Últimos briefings recebidos;
- Projetos cadastrados;
- Projetos publicados;
- Novidades ativas;
- Atalhos para criação de novos conteúdos.

O objetivo do dashboard é oferecer uma visão rápida da operação do site.

---

## 3. Gestão de Briefings

A área de briefings reúne as solicitações enviadas pelos clientes pelo formulário do site.

Cada briefing pode conter:

- Nome do cliente;
- E-mail;
- Telefone;
- Tipo de projeto;
- Mensagem ou descrição da necessidade;
- Referências ou anexos enviados;
- Data de envio;
- Status de acompanhamento.

### Como analisar um briefing

1. Acesse a área **Briefings**.
2. Clique no briefing desejado.
3. Leia as informações enviadas pelo cliente.
4. Abra os anexos, se houver.
5. Entre em contato pelo telefone, e-mail ou WhatsApp informado.

### Status sugeridos

Os briefings podem ser organizados com status como:

```txt
Novo
Em análise
Respondido
Convertido
Arquivado
```

---

## 4. Gestão de Projetos

A área de projetos controla o portfólio exibido no site.

Um projeto pode ser cadastrado como **rascunho** ou **publicado**.

### Criar um novo projeto

1. Acesse **Projetos**.
2. Clique em **Novo Projeto**.
3. Preencha as informações principais.
4. Envie a imagem de capa.
5. Envie as imagens da galeria.
6. Preencha o memorial ou descrição técnica.
7. Defina se o projeto ficará visível no site.
8. Salve as alterações.

---

## 5. Campos de um Projeto

Ao cadastrar um projeto, preencha os campos com atenção.

| Campo | Descrição |
| :--- | :--- |
| **Título** | Nome público do projeto. |
| **Categoria** | Tipo do projeto, como residencial, comercial ou interiores. |
| **Área** | Metragem aproximada do projeto. |
| **Status da Obra** | Situação atual, como conceito, em andamento ou concluído. |
| **Descrição Curta** | Texto resumido para apresentação inicial. |
| **Memorial Técnico** | Texto detalhado do projeto. |
| **Imagem de Capa** | Imagem principal exibida no portfólio. |
| **Galeria** | Conjunto de imagens internas do projeto. |
| **Visibilidade** | Define se o projeto aparece ou não no site. |

---

## 6. Upload de Imagens

O painel permite enviar imagens para o Supabase Storage.

### Recomendações para imagens

Use imagens:

- Em formato `.jpg`, `.png` ou `.webp`;
- Com boa resolução;
- Otimizadas para web;
- Com nomes simples, sem acentos ou caracteres especiais.

Exemplo recomendado:

```txt
casa-contemporanea-fachada.webp
apartamento-minimalista-sala.jpg
projeto-comercial-recepcao.png
```

Evite nomes como:

```txt
Imagem WhatsApp 2025-01-12 às 14.32.10.jpeg
FOTO FINAL!!! versão nova.png
```

---

## 7. Editor de Texto Rico

O memorial técnico do projeto utiliza um editor de texto rico.

Ele pode ser usado para inserir:

- Títulos;
- Subtítulos;
- Parágrafos;
- Listas;
- Destaques;
- Informações técnicas;
- Descrições de materiais;
- Conceito arquitetônico.

### Boa prática de escrita

Mantenha os textos claros, profissionais e objetivos.

Exemplo:

```txt
O projeto foi desenvolvido com foco na integração dos ambientes sociais, iluminação natural e uso de materiais de baixa manutenção. A composição combina tons neutros, madeira natural e elementos metálicos para criar uma atmosfera contemporânea e acolhedora.
```

---

## 8. Publicar ou Salvar como Rascunho

Ao finalizar um projeto, defina sua visibilidade.

### Rascunho

Use quando o projeto ainda está incompleto ou em revisão.

```txt
visivel = false
```

### Publicado

Use quando o projeto já pode aparecer no site.

```txt
visivel = true
```

Antes de publicar, revise:

- Título;
- Texto;
- Imagem de capa;
- Galeria;
- Categoria;
- Status;
- Ortografia;
- Visualização no site.

---

## 9. Gestão de Novidades e Avisos

A área de novidades controla mensagens exibidas no site, como comunicados, destaques ou chamadas importantes.

Cada novidade pode conter:

- Título;
- Mensagem;
- Link opcional;
- Status ativo ou inativo.

### Criar uma novidade

1. Acesse **Novidades** ou **Avisos**.
2. Clique em **Nova Novidade**.
3. Preencha título e mensagem.
4. Adicione um link, se necessário.
5. Marque como ativa.
6. Salve.

### Exemplos de uso

```txt
Novo projeto residencial publicado.
Agenda aberta para novos briefings.
Studio JM apresenta nova linha de interiores contemporâneos.
```

---

## 10. Editar Conteúdos Existentes

Para editar um conteúdo:

1. Acesse a seção correspondente.
2. Selecione o item desejado.
3. Faça as alterações.
4. Salve.
5. Confira o resultado no site público.

Sempre revise o site após alterações importantes.

---

## 11. Excluir Conteúdos

A exclusão deve ser usada com cuidado.

Antes de excluir um projeto, briefing ou novidade, confirme se o conteúdo realmente não será mais necessário.

Quando possível, prefira:

- Desativar uma novidade;
- Salvar um projeto como rascunho;
- Arquivar um briefing.

---

## 12. Checklist antes de Publicar um Projeto

Antes de tornar um projeto visível no site, confira:

- [ ] O título está correto.
- [ ] A categoria foi preenchida.
- [ ] A imagem de capa foi enviada.
- [ ] A galeria possui imagens de qualidade.
- [ ] O memorial técnico foi revisado.
- [ ] O texto não possui erros de digitação.
- [ ] O projeto está marcado como visível.
- [ ] O projeto aparece corretamente no site público.

---

## 13. Problemas Comuns

### Não consigo fazer login

Verifique se:

- O usuário existe no Supabase Auth;
- O e-mail está correto;
- A senha está correta;
- O projeto está usando a URL e a anon key corretas do Supabase.

---

### O projeto não aparece no site

Verifique se:

- O projeto está salvo;
- A opção de visibilidade está ativa;
- A imagem de capa foi enviada corretamente;
- As permissões de leitura da tabela `projetos` estão configuradas;
- O site foi recarregado após a alteração.

---

### A imagem não carrega

Verifique se:

- O upload foi concluído;
- O bucket `portfolio` existe;
- A imagem está em formato permitido;
- O arquivo não ultrapassa o limite de tamanho;
- A URL da imagem foi salva corretamente no banco.

---

### Os briefings não aparecem no painel

Verifique se:

- O formulário público está enviando os dados;
- A tabela `briefings` existe;
- O usuário está logado;
- As políticas RLS permitem leitura para usuários autenticados.

---

## 14. Boas Práticas

- Use imagens otimizadas para web.
- Evite textos muito longos na descrição curta.
- Mantenha nomes de arquivos organizados.
- Revise os projetos antes de publicar.
- Não compartilhe dados de acesso do painel.
- Não exponha chaves sensíveis do Supabase.
- Faça testes após alterações importantes.

---

## 15. Estrutura Recomendada de Uso

Fluxo ideal para publicar um projeto:

```txt
1. Separar imagens finais
2. Otimizar arquivos
3. Criar projeto no painel
4. Enviar capa
5. Enviar galeria
6. Escrever memorial técnico
7. Salvar como rascunho
8. Revisar visualmente
9. Publicar no site
```

---

## 16. Observação sobre Permissões

Neste projeto, qualquer usuário autenticado no Supabase é tratado como administrador.

Para uma versão mais avançada, recomenda-se criar níveis de acesso, como:

```txt
admin
editor
viewer
```

Assim, diferentes usuários podem ter permissões específicas dentro do painel.

---

## Conclusão

O Admin Engine foi desenvolvido para permitir que o Studio JM gerencie seu conteúdo de forma independente, sem necessidade de editar diretamente o código do site.

<<<<<<< HEAD
=======
>>>>>>> 514543e (Atualização de segurança)
>>>>>>> 077e0bed6b95e2e11fa2429325bf8f2e6a96a9f8
Com ele, é possível controlar projetos, briefings, imagens, novidades e publicações em um único ambiente administrativo.