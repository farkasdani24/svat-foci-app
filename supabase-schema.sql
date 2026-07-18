-- Futtasd ezt a teljes szkriptet a Supabase projekted SQL Editor-jában
-- (Supabase Dashboard -> SQL Editor -> New query -> illeszd be -> Run)

create table if not exists players (
  id text primary key,
  name text not null,
  email text,
  phone text,
  photo text,
  jersey_number text,
  is_admin boolean default false,
  created_at timestamptz default now()
);

create table if not exists occasions (
  id text primary key,
  type text not null default 'foci',
  title text,
  date date not null,
  start_time text,
  end_time text,
  location text,
  location_other text,
  fee integer default 0,
  cost integer default 0,
  responses jsonb default '{}'::jsonb,
  payments jsonb default '{}'::jsonb,
  created_at timestamptz default now()
);

create table if not exists extra_fees (
  id text primary key,
  label text not null,
  amount integer default 0,
  target_ids jsonb default '[]'::jsonb,
  payments jsonb default '{}'::jsonb,
  created_at timestamptz default now()
);

create table if not exists settings (
  key text primary key,
  value text
);

-- Row Level Security bekapcsolása
alter table players enable row level security;
alter table occasions enable row level security;
alter table extra_fees enable row level security;
alter table settings enable row level security;

-- FONTOS TUDNIVALÓ:
-- Ez egy zárt, baráti csapat-app, nincs benne egyéni bejelentkezés (csak egy közös
-- admin jelszó), ezért az alábbi szabályok mindenkinek engedélyeznek olvasást és
-- írást, aki ismeri az adatbázis nyilvános kulcsát (ez a kulcs a weboldal kódjában
-- van, tehát bárki elérheti, aki megnyitja az oldalt). Ez megegyezik a korábbi,
-- Claude-os megoldás bizalmi modelljével: nincs érzékeny banki adat az appban,
-- csak csapat-belső nyilvántartás.

create policy "allow all select players" on players for select using (true);
create policy "allow all insert players" on players for insert with check (true);
create policy "allow all update players" on players for update using (true);
create policy "allow all delete players" on players for delete using (true);

create policy "allow all select occasions" on occasions for select using (true);
create policy "allow all insert occasions" on occasions for insert with check (true);
create policy "allow all update occasions" on occasions for update using (true);
create policy "allow all delete occasions" on occasions for delete using (true);

create policy "allow all select extra_fees" on extra_fees for select using (true);
create policy "allow all insert extra_fees" on extra_fees for insert with check (true);
create policy "allow all update extra_fees" on extra_fees for update using (true);
create policy "allow all delete extra_fees" on extra_fees for delete using (true);

create policy "allow all select settings" on settings for select using (true);
create policy "allow all insert settings" on settings for insert with check (true);
create policy "allow all update settings" on settings for update using (true);
