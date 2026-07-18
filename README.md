# Újpesti Apák - SVAT SE foci nyilvántartó

Ez az útmutató végigvezet azon, hogyan tedd élesbe az appot saját adatbázissal
(Supabase) és saját hosztolással (Vercel), GitHubon keresztül.

## 1. lépés — Supabase adatbázis létrehozása

1. Lépj be a [supabase.com](https://supabase.com) fiókodba
2. Kattints **New project**-re, adj neki egy nevet (pl. `svat-foci`), válassz jelszót
   az adatbázisnak (ezt jegyezd meg, de az appban nem lesz rá szükség), és várd meg,
   míg létrejön (kb. 1-2 perc)
3. A bal oldali menüben kattints az **SQL Editor**-ra
4. Nyiss egy **New query**-t, másold be a `supabase-schema.sql` fájl teljes tartalmát,
   majd kattints **Run**-ra — ez létrehozza a szükséges táblákat
5. A bal oldali menüben kattints **Project Settings** (fogaskerék ikon) → **API**
6. Másold ki a **Project URL**-t és az **anon public** kulcsot — ezekre mindjárt
   szükség lesz

## 2. lépés — Kód feltöltése GitHubra

1. Lépj be [github.com](https://github.com)-ra
2. Hozz létre egy új, privát repository-t (pl. `svat-foci-app`)
3. Töltsd fel ennek a mappának a teljes tartalmát a repóba — a legegyszerűbb, ha a
   GitHub weboldalán az **"uploading an existing file"** linkre kattintasz és
   berántod ide az összes fájlt és mappát (a `node_modules` mappát NE töltsd fel,
   ha esetleg létrejött nálad — a `.gitignore` már kizárja)

## 3. lépés — Vercel telepítés

1. Lépj be [vercel.com](https://vercel.com)-ra a GitHub fiókoddal
2. Kattints **Add New... → Project**-re
3. Válaszd ki az imént feltöltött `svat-foci-app` repót, majd **Import**
4. A **Environment Variables** részhez add hozzá:
   - `VITE_SUPABASE_URL` = amit az 1. lépésben kimásoltál
   - `VITE_SUPABASE_ANON_KEY` = amit az 1. lépésben kimásoltál
5. Kattints **Deploy**-ra, várj kb. 1 percet
6. Kész! Kapsz egy linket, ami valahogy így néz ki: `svat-foci-app.vercel.app` —
   ezt küldheted el bárkinek, Claude-fiók nélkül is eléri

## Ha módosítani szeretnéd az appot

Mostantól, ha a kódon változtatsz (akár velem, akár magad), a módosított fájlokat
csak fel kell töltened ugyanabba a GitHub repóba — a Vercel automatikusan újra
kiteszi az oldalt pár másodperc alatt, nincs vele más teendőd.

## Helyi fejlesztés (opcionális)

Ha a saját géped is ki szeretnéd próbálni futtatás előtt:

```bash
npm install
cp .env.example .env
# írd be a .env fájlba a saját Supabase URL-t és anon kulcsot
npm run dev
```

## Admin jelszó

Az app első megnyitásakor, amikor rákattintasz az **Admin** gombra, még nincs
beállítva jelszó — amit akkor beírsz, az lesz az admin jelszó mindenki számára.
Ez az adatbázisban tárolódik, nem titkosítva — ez egy baráti csapat-app, nem
banki rendszer, ennek megfelelő a védelmi szint.
