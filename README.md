<h1 align="center">🏛️ Studio JM</h1>

<h3 align="center">Architecture Portfolio & Intelligence Engine</h3>

<p align="center">
  Plataforma digital para apresentação de projetos arquitetônicos, captação de briefings e gestão administrativa integrada.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
  <img src="https://img.shields.io/badge/Tailwind_CSS-38BDF8?style=for-the-badge&logo=tailwindcss&logoColor=white">
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
  <img src="https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white">
</p>

<p align="center">
  <a href="#-visão-geral">Visão Geral</a> •
  <a href="#-módulos">Módulos</a> •
  <a href="#-stack-tecnológica">Stack</a> •
  <a href="#-interface-preview">Preview</a> •
  <a href="#-documentação">Documentação</a>
</p>

---

## 💎 Visão Geral

O **Studio JM** é uma plataforma web desenvolvida para estúdios de arquitetura e design de interiores que precisam unir presença digital, portfólio profissional e gestão operacional em um único ambiente.

A aplicação combina uma experiência pública voltada à apresentação de projetos com um painel administrativo conectado ao Supabase, permitindo gerenciar conteúdos, briefings, imagens, publicações e informações do site sem depender de alterações manuais no código.

---

## 🧩 Módulos

### 🌐 Website Institucional

Interface pública projetada para apresentar o estúdio, destacar projetos e captar novos clientes por meio de uma experiência visual sofisticada.

**Principais recursos:**

- Layout responsivo com estética premium;
- Navegação suave com efeitos de scroll e parallax;
- Portfólio interativo com galerias de imagens;
- Modal detalhado para apresentação completa dos projetos;
- Formulário de briefing conectado ao Supabase;
- Upload de referências e arquivos enviados pelo cliente;
- Redirecionamento estratégico para WhatsApp após o envio do briefing;
- Sistema de avisos e novidades atualizado pelo painel admin.

---

### ⚙️ Admin Engine

Painel administrativo protegido por autenticação, criado para centralizar a gestão operacional do site.

**Principais recursos:**

- Login seguro com Supabase Auth;
- Gestão de briefings recebidos;
- Cadastro, edição e publicação de projetos;
- Upload de imagens de capa e galeria via Supabase Storage;
- Editor de texto rico para memoriais e descrições técnicas;
- Controle de visibilidade entre rascunho e projeto publicado;
- Gestão de novidades e avisos exibidos no site;
- Operações CRUD para conteúdos administrativos.

---

## 🛠️ Stack Tecnológica

A aplicação foi construída com uma arquitetura leve, baseada em front-end estático e integração direta com serviços BaaS.

| Tecnologia | Uso no Projeto |
| :--- | :--- |
| **HTML5 / CSS3** | Estrutura semântica e base visual da aplicação. |
| **Vanilla JavaScript** | Regras de negócio, interações e integração com APIs. |
| **TailwindCSS CDN** | Estilização rápida, responsiva e escalável. |
| **Supabase** | Database, autenticação, storage e políticas de segurança. |
| **Quill.js** | Editor de texto rico para conteúdo administrativo. |
| **Swiper.js** | Carrosséis e galerias responsivas. |
| **Lenis.js** | Scroll suave e experiência de navegação mais fluida. |

---

## 🧠 Arquitetura da Aplicação

```txt
Cliente
  ↓
Website Estático
  ↓
Supabase API
  ├── Authentication
  ├── PostgreSQL Database
  └── Storage Buckets
```

A estrutura elimina a necessidade de um servidor intermediário tradicional, mantendo o projeto simples, performático e de baixo custo operacional.

---

## 📸 Interface Preview

<details>
  <summary><strong>🌐 Ver previews do Website Institucional</strong></summary>

  <br>

  <p align="center">
    <img src="https://imgur.com/rnvY4do.png" width="75%" alt="Site Preview">
    <br><br>
    <img src="https://imgur.com/rtjnxoQ.png" width="75%" alt="Site Preview">
    <br><br>
    <img src="https://imgur.com/rZrzj6q.png" width="75%" alt="Site Preview">
    <br><br>
    <img src="https://imgur.com/wLt76pr.png" width="75%" alt="Site Preview">
    <br><br>
    <img src="https://imgur.com/z0y0lEl.png" width="75%" alt="Site Preview">
    <br><br>
    <img src="https://imgur.com/D9iD3IG.png" width="75%" alt="Site Preview">
  </p>

</details>

<br>

<details>
  <summary><strong>⚙️ Ver previews do Admin Engine</strong></summary>

  <br>

  <p align="center">
    <img src="https://imgur.com/7nZl9n2.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/w3JFqkD.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/3R4zXkZ.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/xaPdwvZ.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/c4FbHz9.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/MppQGLC.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/lKeZO28.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/tBnvIdQ.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/2GHxy2K.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/21h6sYo.png" width="75%" alt="Admin Preview">
    <br><br>
    <img src="https://imgur.com/TCmDrry.png" width="75%" alt="Admin Preview">
  </p>

</details>

---

## 📚 Documentação

A documentação técnica foi separada para manter o README limpo e objetivo.

| Documento | Descrição |
| :--- | :--- |
| [`SUPABASE_SETUP.md`](./docs/SUPABASE_SETUP.md) | Configuração completa do Supabase, Auth, Storage e RLS. |
| [`DATABASE_SCHEMA.sql`](./docs/DATABASE_SCHEMA.sql) | Script SQL base para criação das tabelas e políticas. |
| [`ADMIN_GUIDE.md`](./docs/ADMIN_GUIDE.md) | Guia de uso do painel administrativo. |
