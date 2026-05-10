<<<<<<< HEAD
=======
<<<<<<< HEAD
-- =========================================================
-- Studio JM | Database Schema
-- Supabase PostgreSQL + Auth + Storage + RLS
-- =========================================================

-- Este arquivo cria a estrutura base do projeto:
-- - Tabelas: briefings, projetos, novidades
-- - Buckets: portfolio, briefings_attachments
-- - Políticas RLS para acesso público e administrativo
--
-- Observação:
-- Qualquer usuário autenticado é considerado administrador neste projeto.

-- =========================================================
-- EXTENSIONS
-- =========================================================

create extension if not exists "pgcrypto";

-- =========================================================
-- TABLE: briefings
-- =========================================================

create table if not exists public.briefings (
  id uuid primary key default gen_random_uuid(),

  nome text not null,
  email text,
  telefone text,

  tipo_projeto text,
  mensagem text,

  referencias jsonb default '[]'::jsonb,

  status text default 'novo',

  created_at timestamptz default now()
);

-- =========================================================
-- TABLE: projetos
-- =========================================================

create table if not exists public.projetos (
  id uuid primary key default gen_random_uuid(),

  titulo text not null,
  slug text unique,

  categoria text,
  area_m2 numeric,
  status_obra text,

  descricao_curta text,
  memorial_html text,

  capa_url text,
  galeria_urls jsonb default '[]'::jsonb,

  visivel boolean default false,
  ordem integer default 0,

  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- =========================================================
-- TABLE: novidades
-- =========================================================

create table if not exists public.novidades (
  id uuid primary key default gen_random_uuid(),

  titulo text not null,
  mensagem text,
  link_url text,

  ativo boolean default true,

  created_at timestamptz default now()
);

-- =========================================================
-- UPDATED_AT TRIGGER
-- =========================================================

create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists set_projetos_updated_at on public.projetos;

create trigger set_projetos_updated_at
before update on public.projetos
for each row
execute function public.set_updated_at();

-- =========================================================
-- INDEXES
-- =========================================================

create index if not exists idx_briefings_created_at
on public.briefings (created_at desc);

create index if not exists idx_projetos_visivel
on public.projetos (visivel);

create index if not exists idx_projetos_ordem
on public.projetos (ordem);

create index if not exists idx_projetos_slug
on public.projetos (slug);

create index if not exists idx_novidades_ativo
on public.novidades (ativo);

-- =========================================================
-- ENABLE RLS
-- =========================================================

alter table public.briefings enable row level security;
alter table public.projetos enable row level security;
alter table public.novidades enable row level security;

-- =========================================================
-- DROP OLD POLICIES
-- =========================================================

drop policy if exists "Permitir envio publico de briefings" on public.briefings;
drop policy if exists "Permitir leitura de briefings para admins" on public.briefings;
drop policy if exists "Permitir atualização de briefings para admins" on public.briefings;
drop policy if exists "Permitir exclusão de briefings para admins" on public.briefings;

drop policy if exists "Permitir leitura publica de projetos visiveis" on public.projetos;
drop policy if exists "Permitir criação de projetos para admins" on public.projetos;
drop policy if exists "Permitir atualização de projetos para admins" on public.projetos;
drop policy if exists "Permitir exclusão de projetos para admins" on public.projetos;

drop policy if exists "Permitir leitura publica de novidades ativas" on public.novidades;
drop policy if exists "Permitir criação de novidades para admins" on public.novidades;
drop policy if exists "Permitir atualização de novidades para admins" on public.novidades;
drop policy if exists "Permitir exclusão de novidades para admins" on public.novidades;

-- =========================================================
-- RLS POLICIES: briefings
-- =========================================================

-- Visitantes podem enviar briefings pelo formulário público.
create policy "Permitir envio publico de briefings"
on public.briefings
for insert
to anon, authenticated
with check (true);

-- Apenas usuários autenticados podem ler os briefings.
create policy "Permitir leitura de briefings para admins"
on public.briefings
for select
to authenticated
using (true);

-- Apenas usuários autenticados podem atualizar briefings.
create policy "Permitir atualização de briefings para admins"
on public.briefings
for update
to authenticated
using (true)
with check (true);

-- Apenas usuários autenticados podem excluir briefings.
create policy "Permitir exclusão de briefings para admins"
on public.briefings
for delete
to authenticated
using (true);

-- =========================================================
-- RLS POLICIES: projetos
-- =========================================================

-- Visitantes veem apenas projetos publicados.
-- Usuários autenticados veem todos.
create policy "Permitir leitura publica de projetos visiveis"
on public.projetos
for select
to anon, authenticated
using (
  visivel = true
  or auth.role() = 'authenticated'
);

-- Apenas usuários autenticados podem criar projetos.
create policy "Permitir criação de projetos para admins"
on public.projetos
for insert
to authenticated
with check (true);

-- Apenas usuários autenticados podem atualizar projetos.
create policy "Permitir atualização de projetos para admins"
on public.projetos
for update
to authenticated
using (true)
with check (true);

-- Apenas usuários autenticados podem excluir projetos.
create policy "Permitir exclusão de projetos para admins"
on public.projetos
for delete
to authenticated
using (true);

-- =========================================================
-- RLS POLICIES: novidades
-- =========================================================

-- Visitantes veem apenas novidades ativas.
-- Usuários autenticados veem todas.
create policy "Permitir leitura publica de novidades ativas"
on public.novidades
for select
to anon, authenticated
using (
  ativo = true
  or auth.role() = 'authenticated'
);

-- Apenas usuários autenticados podem criar novidades.
create policy "Permitir criação de novidades para admins"
on public.novidades
for insert
to authenticated
with check (true);

-- Apenas usuários autenticados podem atualizar novidades.
create policy "Permitir atualização de novidades para admins"
on public.novidades
for update
to authenticated
using (true)
with check (true);

-- Apenas usuários autenticados podem excluir novidades.
create policy "Permitir exclusão de novidades para admins"
on public.novidades
for delete
to authenticated
using (true);

-- =========================================================
-- STORAGE BUCKETS
-- =========================================================

-- Bucket público para imagens do portfólio.
insert into storage.buckets (
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
)
values (
  'portfolio',
  'portfolio',
  true,
  10485760,
  array[
    'image/jpeg',
    'image/png',
    'image/webp'
  ]
)
on conflict (id) do update
set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

-- Bucket privado para anexos enviados no briefing.
insert into storage.buckets (
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
)
values (
  'briefings_attachments',
  'briefings_attachments',
  false,
  10485760,
  array[
    'image/jpeg',
    'image/png',
    'image/webp',
    'application/pdf'
  ]
)
on conflict (id) do update
set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

-- =========================================================
-- DROP OLD STORAGE POLICIES
-- =========================================================

drop policy if exists "Permitir leitura publica do portfolio" on storage.objects;
drop policy if exists "Permitir upload de imagens do portfolio para admins" on storage.objects;
drop policy if exists "Permitir atualização de imagens do portfolio para admins" on storage.objects;
drop policy if exists "Permitir exclusão de imagens do portfolio para admins" on storage.objects;

drop policy if exists "Permitir upload publico de anexos de briefing" on storage.objects;
drop policy if exists "Permitir leitura de anexos para admins" on storage.objects;
drop policy if exists "Permitir exclusão de anexos para admins" on storage.objects;

-- =========================================================
-- STORAGE POLICIES: portfolio
-- =========================================================

-- Qualquer visitante pode visualizar imagens do portfólio.
create policy "Permitir leitura publica do portfolio"
on storage.objects
for select
to anon, authenticated
using (
  bucket_id = 'portfolio'
);

-- Apenas usuários autenticados podem enviar imagens para o portfólio.
create policy "Permitir upload de imagens do portfolio para admins"
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'portfolio'
);

-- Apenas usuários autenticados podem atualizar imagens do portfólio.
create policy "Permitir atualização de imagens do portfolio para admins"
on storage.objects
for update
to authenticated
using (
  bucket_id = 'portfolio'
)
with check (
  bucket_id = 'portfolio'
);

-- Apenas usuários autenticados podem excluir imagens do portfólio.
create policy "Permitir exclusão de imagens do portfolio para admins"
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'portfolio'
);

-- =========================================================
-- STORAGE POLICIES: briefings_attachments
-- =========================================================

-- Visitantes podem enviar anexos pelo formulário de briefing.
create policy "Permitir upload publico de anexos de briefing"
on storage.objects
for insert
to anon, authenticated
with check (
  bucket_id = 'briefings_attachments'
);

-- Apenas usuários autenticados podem visualizar anexos de briefing.
create policy "Permitir leitura de anexos para admins"
on storage.objects
for select
to authenticated
using (
  bucket_id = 'briefings_attachments'
);

-- Apenas usuários autenticados podem excluir anexos de briefing.
create policy "Permitir exclusão de anexos para admins"
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'briefings_attachments'
);

-- =========================================================
-- END
=======
>>>>>>> 077e0bed6b95e2e11fa2429325bf8f2e6a96a9f8
-- =========================================================
-- Studio JM | Database Schema
-- Supabase PostgreSQL + Auth + Storage + RLS
-- =========================================================

-- Este arquivo cria a estrutura base do projeto:
-- - Tabelas: briefings, projetos, novidades
-- - Buckets: portfolio, briefings_attachments
-- - Políticas RLS para acesso público e administrativo
--
-- Observação:
-- Qualquer usuário autenticado é considerado administrador neste projeto.

-- =========================================================
-- EXTENSIONS
-- =========================================================

create extension if not exists "pgcrypto";

-- =========================================================
-- TABLE: briefings
-- =========================================================

create table if not exists public.briefings (
  id uuid primary key default gen_random_uuid(),

  nome text not null,
  email text,
  telefone text,

  tipo_projeto text,
  mensagem text,

  referencias jsonb default '[]'::jsonb,

  status text default 'novo',

  created_at timestamptz default now()
);

-- =========================================================
-- TABLE: projetos
-- =========================================================

create table if not exists public.projetos (
  id uuid primary key default gen_random_uuid(),

  titulo text not null,
  slug text unique,

  categoria text,
  area_m2 numeric,
  status_obra text,

  descricao_curta text,
  memorial_html text,

  capa_url text,
  galeria_urls jsonb default '[]'::jsonb,

  visivel boolean default false,
  ordem integer default 0,

  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- =========================================================
-- TABLE: novidades
-- =========================================================

create table if not exists public.novidades (
  id uuid primary key default gen_random_uuid(),

  titulo text not null,
  mensagem text,
  link_url text,

  ativo boolean default true,

  created_at timestamptz default now()
);

-- =========================================================
-- UPDATED_AT TRIGGER
-- =========================================================

create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists set_projetos_updated_at on public.projetos;

create trigger set_projetos_updated_at
before update on public.projetos
for each row
execute function public.set_updated_at();

-- =========================================================
-- INDEXES
-- =========================================================

create index if not exists idx_briefings_created_at
on public.briefings (created_at desc);

create index if not exists idx_projetos_visivel
on public.projetos (visivel);

create index if not exists idx_projetos_ordem
on public.projetos (ordem);

create index if not exists idx_projetos_slug
on public.projetos (slug);

create index if not exists idx_novidades_ativo
on public.novidades (ativo);

-- =========================================================
-- ENABLE RLS
-- =========================================================

alter table public.briefings enable row level security;
alter table public.projetos enable row level security;
alter table public.novidades enable row level security;

-- =========================================================
-- DROP OLD POLICIES
-- =========================================================

drop policy if exists "Permitir envio publico de briefings" on public.briefings;
drop policy if exists "Permitir leitura de briefings para admins" on public.briefings;
drop policy if exists "Permitir atualização de briefings para admins" on public.briefings;
drop policy if exists "Permitir exclusão de briefings para admins" on public.briefings;

drop policy if exists "Permitir leitura publica de projetos visiveis" on public.projetos;
drop policy if exists "Permitir criação de projetos para admins" on public.projetos;
drop policy if exists "Permitir atualização de projetos para admins" on public.projetos;
drop policy if exists "Permitir exclusão de projetos para admins" on public.projetos;

drop policy if exists "Permitir leitura publica de novidades ativas" on public.novidades;
drop policy if exists "Permitir criação de novidades para admins" on public.novidades;
drop policy if exists "Permitir atualização de novidades para admins" on public.novidades;
drop policy if exists "Permitir exclusão de novidades para admins" on public.novidades;

-- =========================================================
-- RLS POLICIES: briefings
-- =========================================================

-- Visitantes podem enviar briefings pelo formulário público.
create policy "Permitir envio publico de briefings"
on public.briefings
for insert
to anon, authenticated
with check (true);

-- Apenas usuários autenticados podem ler os briefings.
create policy "Permitir leitura de briefings para admins"
on public.briefings
for select
to authenticated
using (true);

-- Apenas usuários autenticados podem atualizar briefings.
create policy "Permitir atualização de briefings para admins"
on public.briefings
for update
to authenticated
using (true)
with check (true);

-- Apenas usuários autenticados podem excluir briefings.
create policy "Permitir exclusão de briefings para admins"
on public.briefings
for delete
to authenticated
using (true);

-- =========================================================
-- RLS POLICIES: projetos
-- =========================================================

-- Visitantes veem apenas projetos publicados.
-- Usuários autenticados veem todos.
create policy "Permitir leitura publica de projetos visiveis"
on public.projetos
for select
to anon, authenticated
using (
  visivel = true
  or auth.role() = 'authenticated'
);

-- Apenas usuários autenticados podem criar projetos.
create policy "Permitir criação de projetos para admins"
on public.projetos
for insert
to authenticated
with check (true);

-- Apenas usuários autenticados podem atualizar projetos.
create policy "Permitir atualização de projetos para admins"
on public.projetos
for update
to authenticated
using (true)
with check (true);

-- Apenas usuários autenticados podem excluir projetos.
create policy "Permitir exclusão de projetos para admins"
on public.projetos
for delete
to authenticated
using (true);

-- =========================================================
-- RLS POLICIES: novidades
-- =========================================================

-- Visitantes veem apenas novidades ativas.
-- Usuários autenticados veem todas.
create policy "Permitir leitura publica de novidades ativas"
on public.novidades
for select
to anon, authenticated
using (
  ativo = true
  or auth.role() = 'authenticated'
);

-- Apenas usuários autenticados podem criar novidades.
create policy "Permitir criação de novidades para admins"
on public.novidades
for insert
to authenticated
with check (true);

-- Apenas usuários autenticados podem atualizar novidades.
create policy "Permitir atualização de novidades para admins"
on public.novidades
for update
to authenticated
using (true)
with check (true);

-- Apenas usuários autenticados podem excluir novidades.
create policy "Permitir exclusão de novidades para admins"
on public.novidades
for delete
to authenticated
using (true);

-- =========================================================
-- STORAGE BUCKETS
-- =========================================================

-- Bucket público para imagens do portfólio.
insert into storage.buckets (
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
)
values (
  'portfolio',
  'portfolio',
  true,
  10485760,
  array[
    'image/jpeg',
    'image/png',
    'image/webp'
  ]
)
on conflict (id) do update
set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

-- Bucket privado para anexos enviados no briefing.
insert into storage.buckets (
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
)
values (
  'briefings_attachments',
  'briefings_attachments',
  false,
  10485760,
  array[
    'image/jpeg',
    'image/png',
    'image/webp',
    'application/pdf'
  ]
)
on conflict (id) do update
set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

-- =========================================================
-- DROP OLD STORAGE POLICIES
-- =========================================================

drop policy if exists "Permitir leitura publica do portfolio" on storage.objects;
drop policy if exists "Permitir upload de imagens do portfolio para admins" on storage.objects;
drop policy if exists "Permitir atualização de imagens do portfolio para admins" on storage.objects;
drop policy if exists "Permitir exclusão de imagens do portfolio para admins" on storage.objects;

drop policy if exists "Permitir upload publico de anexos de briefing" on storage.objects;
drop policy if exists "Permitir leitura de anexos para admins" on storage.objects;
drop policy if exists "Permitir exclusão de anexos para admins" on storage.objects;

-- =========================================================
-- STORAGE POLICIES: portfolio
-- =========================================================

-- Qualquer visitante pode visualizar imagens do portfólio.
create policy "Permitir leitura publica do portfolio"
on storage.objects
for select
to anon, authenticated
using (
  bucket_id = 'portfolio'
);

-- Apenas usuários autenticados podem enviar imagens para o portfólio.
create policy "Permitir upload de imagens do portfolio para admins"
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'portfolio'
);

-- Apenas usuários autenticados podem atualizar imagens do portfólio.
create policy "Permitir atualização de imagens do portfolio para admins"
on storage.objects
for update
to authenticated
using (
  bucket_id = 'portfolio'
)
with check (
  bucket_id = 'portfolio'
);

-- Apenas usuários autenticados podem excluir imagens do portfólio.
create policy "Permitir exclusão de imagens do portfolio para admins"
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'portfolio'
);

-- =========================================================
-- STORAGE POLICIES: briefings_attachments
-- =========================================================

-- Visitantes podem enviar anexos pelo formulário de briefing.
create policy "Permitir upload publico de anexos de briefing"
on storage.objects
for insert
to anon, authenticated
with check (
  bucket_id = 'briefings_attachments'
);

-- Apenas usuários autenticados podem visualizar anexos de briefing.
create policy "Permitir leitura de anexos para admins"
on storage.objects
for select
to authenticated
using (
  bucket_id = 'briefings_attachments'
);

-- Apenas usuários autenticados podem excluir anexos de briefing.
create policy "Permitir exclusão de anexos para admins"
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'briefings_attachments'
);

-- =========================================================
-- END
<<<<<<< HEAD
=======
>>>>>>> 514543e (Atualização de segurança)
>>>>>>> 077e0bed6b95e2e11fa2429325bf8f2e6a96a9f8
-- =========================================================