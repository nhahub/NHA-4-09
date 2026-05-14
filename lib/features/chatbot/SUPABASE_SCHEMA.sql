-- ══════════════════════════════════════════════════════════════
--  Run this SQL in your Supabase project → SQL Editor
-- ══════════════════════════════════════════════════════════════

-- 1. Chat sessions table
create table if not exists public.chat_sessions (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references auth.users(id) on delete cascade,
  title       text not null default 'New Chat',
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- 2. Chat messages table
create table if not exists public.chat_messages (
  id          uuid primary key default gen_random_uuid(),
  session_id  uuid not null references public.chat_sessions(id) on delete cascade,
  user_id     uuid not null references auth.users(id) on delete cascade,
  role        text not null check (role in ('user', 'assistant')),
  content     text not null,
  created_at  timestamptz not null default now()
);

-- 3. Indexes for performance
create index if not exists chat_sessions_user_id_idx on public.chat_sessions(user_id);
create index if not exists chat_sessions_updated_at_idx on public.chat_sessions(updated_at desc);
create index if not exists chat_messages_session_id_idx on public.chat_messages(session_id);
create index if not exists chat_messages_created_at_idx on public.chat_messages(created_at asc);

-- 4. Enable Row Level Security
alter table public.chat_sessions enable row level security;
alter table public.chat_messages enable row level security;

-- 5. RLS Policies — users see & modify only their own data

-- chat_sessions
create policy "Users can view own sessions"
  on public.chat_sessions for select
  using (auth.uid() = user_id);

create policy "Users can insert own sessions"
  on public.chat_sessions for insert
  with check (auth.uid() = user_id);

create policy "Users can update own sessions"
  on public.chat_sessions for update
  using (auth.uid() = user_id);

create policy "Users can delete own sessions"
  on public.chat_sessions for delete
  using (auth.uid() = user_id);

-- chat_messages
create policy "Users can view own messages"
  on public.chat_messages for select
  using (auth.uid() = user_id);

create policy "Users can insert own messages"
  on public.chat_messages for insert
  with check (auth.uid() = user_id);

create policy "Users can delete own messages"
  on public.chat_messages for delete
  using (auth.uid() = user_id);
