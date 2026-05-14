-- Community social tables, RLS, triggers, and realtime helpers.
-- Apply in Supabase SQL editor or via CLI. Adjust if tables already exist.

-- ---------------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------------

create table if not exists public.community_posts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.user_data (id) on delete cascade,
  content text not null default '',
  created_at timestamptz not null default now(),
  shares_count integer not null default 0,
  comments_count integer not null default 0
);

create table if not exists public.community_post_media (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references public.community_posts (id) on delete cascade,
  media_url text not null,
  media_type text not null default 'image',
  sort_order integer not null default 0,
  constraint community_post_media_type_chk check (media_type = 'image')
);

create table if not exists public.community_post_likes (
  post_id uuid not null references public.community_posts (id) on delete cascade,
  user_id uuid not null references public.user_data (id) on delete cascade,
  primary key (post_id, user_id)
);

create table if not exists public.community_comments (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references public.community_posts (id) on delete cascade,
  user_id uuid not null references public.user_data (id) on delete cascade,
  parent_id uuid references public.community_comments (id) on delete cascade,
  content text not null,
  created_at timestamptz not null default now(),
  likes_count integer not null default 0,
  replies_count integer not null default 0
);

create table if not exists public.community_comment_likes (
  comment_id uuid not null references public.community_comments (id) on delete cascade,
  user_id uuid not null references public.user_data (id) on delete cascade,
  primary key (comment_id, user_id)
);

create index if not exists idx_community_posts_created_at on public.community_posts (created_at desc);
create index if not exists idx_community_post_media_post_id on public.community_post_media (post_id);
create index if not exists idx_community_comments_post_id on public.community_comments (post_id);
create index if not exists idx_community_comments_parent_id on public.community_comments (parent_id);

-- ---------------------------------------------------------------------------
-- Triggers: comment like counts
-- ---------------------------------------------------------------------------

create or replace function public.community_comment_likes_after_change()
returns trigger
language plpgsql
as $$
begin
  if tg_op = 'INSERT' then
    update public.community_comments
      set likes_count = likes_count + 1
      where id = new.comment_id;
    return new;
  elsif tg_op = 'DELETE' then
    update public.community_comments
      set likes_count = greatest(likes_count - 1, 0)
      where id = old.comment_id;
    return old;
  end if;
  return null;
end;
$$;

drop trigger if exists trg_community_comment_likes_aud on public.community_comment_likes;

create trigger trg_community_comment_likes_aud
  after insert or delete on public.community_comment_likes
  for each row execute procedure public.community_comment_likes_after_change();

-- ---------------------------------------------------------------------------
-- Triggers: post comment totals + reply counts
-- ---------------------------------------------------------------------------

create or replace function public.community_comments_after_change()
returns trigger
language plpgsql
as $$
begin
  if tg_op = 'INSERT' then
    update public.community_posts
      set comments_count = comments_count + 1
      where id = new.post_id;
    if new.parent_id is not null then
      update public.community_comments
        set replies_count = replies_count + 1
        where id = new.parent_id;
    end if;
    return new;
  elsif tg_op = 'DELETE' then
    update public.community_posts
      set comments_count = greatest(comments_count - 1, 0)
      where id = old.post_id;
    if old.parent_id is not null then
      update public.community_comments
        set replies_count = greatest(replies_count - 1, 0)
        where id = old.parent_id;
    end if;
    return old;
  end if;
  return null;
end;
$$;

drop trigger if exists trg_community_comments_aud on public.community_comments;

create trigger trg_community_comments_aud
  after insert or delete on public.community_comments
  for each row execute procedure public.community_comments_after_change();

-- ---------------------------------------------------------------------------
-- RPC: atomic share increment (called from app)
-- ---------------------------------------------------------------------------

create or replace function public.increment_community_post_shares(p_post_id uuid)
returns void
language plpgsql
security invoker
as $$
begin
  update public.community_posts
    set shares_count = shares_count + 1
    where id = p_post_id;
end;
$$;

grant execute on function public.increment_community_post_shares(uuid) to authenticated;

-- ---------------------------------------------------------------------------
-- Row Level Security
-- ---------------------------------------------------------------------------

alter table public.community_posts enable row level security;
alter table public.community_post_media enable row level security;
alter table public.community_post_likes enable row level security;
alter table public.community_comments enable row level security;
alter table public.community_comment_likes enable row level security;

-- Posts: readable by authenticated users; insert/update own
drop policy if exists "community_posts_select_authenticated" on public.community_posts;
create policy "community_posts_select_authenticated"
  on public.community_posts for select
  to authenticated
  using (true);

drop policy if exists "community_posts_insert_own" on public.community_posts;
create policy "community_posts_insert_own"
  on public.community_posts for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "community_posts_delete_own" on public.community_posts;
create policy "community_posts_delete_own"
  on public.community_posts for delete
  to authenticated
  using (auth.uid() = user_id);

-- Post media
drop policy if exists "community_post_media_select" on public.community_post_media;
create policy "community_post_media_select"
  on public.community_post_media for select
  to authenticated
  using (true);

drop policy if exists "community_post_media_insert" on public.community_post_media;
create policy "community_post_media_insert"
  on public.community_post_media for insert
  to authenticated
  with check (
    exists (
      select 1 from public.community_posts p
      where p.id = post_id and p.user_id = auth.uid()
    )
  );

drop policy if exists "community_post_media_delete_own" on public.community_post_media;
create policy "community_post_media_delete_own"
  on public.community_post_media for delete
  to authenticated
  using (
    exists (
      select 1 from public.community_posts p
      where p.id = post_id and p.user_id = auth.uid()
    )
  );

-- Post likes
drop policy if exists "community_post_likes_select" on public.community_post_likes;
create policy "community_post_likes_select"
  on public.community_post_likes for select
  to authenticated
  using (true);

drop policy if exists "community_post_likes_insert_own" on public.community_post_likes;
create policy "community_post_likes_insert_own"
  on public.community_post_likes for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "community_post_likes_delete_own" on public.community_post_likes;
create policy "community_post_likes_delete_own"
  on public.community_post_likes for delete
  to authenticated
  using (auth.uid() = user_id);

-- Comments
drop policy if exists "community_comments_select" on public.community_comments;
create policy "community_comments_select"
  on public.community_comments for select
  to authenticated
  using (true);

drop policy if exists "community_comments_insert_own" on public.community_comments;
create policy "community_comments_insert_own"
  on public.community_comments for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "community_comments_delete_own" on public.community_comments;
create policy "community_comments_delete_own"
  on public.community_comments for delete
  to authenticated
  using (auth.uid() = user_id);

-- Comment likes
drop policy if exists "community_comment_likes_select" on public.community_comment_likes;
create policy "community_comment_likes_select"
  on public.community_comment_likes for select
  to authenticated
  using (true);

drop policy if exists "community_comment_likes_insert_own" on public.community_comment_likes;
create policy "community_comment_likes_insert_own"
  on public.community_comment_likes for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "community_comment_likes_delete_own" on public.community_comment_likes;
create policy "community_comment_likes_delete_own"
  on public.community_comment_likes for delete
  to authenticated
  using (auth.uid() = user_id);

-- ---------------------------------------------------------------------------
-- Realtime (idempotent-ish)
-- ---------------------------------------------------------------------------

alter publication supabase_realtime add table public.community_posts;
alter publication supabase_realtime add table public.community_post_media;
alter publication supabase_realtime add table public.community_post_likes;
alter publication supabase_realtime add table public.community_comments;
alter publication supabase_realtime add table public.community_comment_likes;
