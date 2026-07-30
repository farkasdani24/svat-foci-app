-- Futtasd le a Supabase SQL Editorában (SQL Editor -> New query -> illeszd be -> Run)
-- Ez a migráció hozzáadja a "lomtár" (soft delete) funkcióhoz szükséges oszlopokat.
-- A meglévő adatokat NEM törli, csak új, alapértelmezett értékű oszlopokat ad hozzá.

alter table occasions add column if not exists is_deleted boolean default false;
alter table occasions add column if not exists deleted_at timestamptz;
