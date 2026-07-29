-- Futtasd le a Supabase SQL Editorában (SQL Editor -> New query -> illeszd be -> Run)
-- Ez a migráció hozzáadja az új funkciókhoz szükséges oszlopokat.
-- A meglévő adatokat NEM törli, csak új, alapértelmezett értékű oszlopokat ad hozzá.

alter table occasions add column if not exists payment_method jsonb default '{}'::jsonb;
alter table occasions add column if not exists motm_votes jsonb default '{}'::jsonb;
alter table players add column if not exists birthday date;
