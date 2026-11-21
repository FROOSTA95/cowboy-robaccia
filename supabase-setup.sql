-- Incolla tutto questo in Supabase > SQL Editor > Run

create table if not exists items (
  id text primary key,
  kind text not null check (kind in ('dischi','libri')),
  title text not null,
  author text not null,
  genre text default '',
  year text default '',
  score numeric default 0,
  review text default '',
  colors jsonb default '["#3a0ca3","#f72585"]',
  cover text default '',
  created_at bigint not null default (extract(epoch from now())*1000)::bigint
);

alter table items enable row level security;
create policy "lettura pubblica" on items for select using (true);
create policy "inserimento proprietario" on items for insert to authenticated with check (true);
create policy "modifica proprietario" on items for update to authenticated using (true) with check (true);
create policy "eliminazione proprietario" on items for delete to authenticated using (true);

insert into storage.buckets (id, name, public) values ('covers','covers',true) on conflict (id) do nothing;
create policy "copertine lettura" on storage.objects for select using (bucket_id = 'covers');
create policy "copertine upload" on storage.objects for insert to authenticated with check (bucket_id = 'covers');
create policy "copertine modifica" on storage.objects for update to authenticated using (bucket_id = 'covers');
create policy "copertine eliminazione" on storage.objects for delete to authenticated using (bucket_id = 'covers');
