# Cowboy Robaccia – guida all'installazione gratuita

Tempo: circa 20 minuti. Costo: zero. Le schermate dei siti possono cambiare un po': cerca le voci con lo stesso nome.

## Cosa c'è nella cartella
- `config.js` – qui incolli i dati di Supabase (passo 3)
- `index.html` – l'app
- `manifest.webmanifest`, `sw.js`, `icons/` – servono per installarla sul telefono
- `supabase-setup.sql` – crea l'archivio delle recensioni

## 1. Crea l'archivio (Supabase)
1. Vai su supabase.com, registrati gratis e crea un **New project** (scegli una regione europea e una password per il database; salvala).
2. Nel menu a sinistra apri **SQL Editor**, incolla tutto il contenuto di `supabase-setup.sql` e premi **Run**.
3. Apri **Authentication → Users → Add user**: inserisci la tua email e una password, e spunta "Auto confirm user" se c'è. Sarà il tuo accesso.
4. Sempre in **Authentication**, nelle impostazioni del provider **Email**, disattiva "Allow new users to sign up". Così solo tu puoi accedere. Gli altri vedono il catalogo ma non possono modificarlo.

## 2. Copia i due dati di collegamento
In **Project Settings → API** (o "Data API / API Keys") copia:
- **Project URL**, tipo `https://xxxx.supabase.co`
- **Publishable key** (chiamata anche "anon key"). Non copiare mai la "secret" o "service_role" key.

## 3. Incollali nell'app
Apri `config.js` con un editor di testo (Blocco note va bene) e sostituisci le due scritte `INCOLLA_QUI...` tra apici con l'URL e la chiave. Salva.

## 4. Metti il sito online (Netlify, senza codice)
1. Vai su app.netlify.com/drop e registrati gratis.
2. Trascina l'intera cartella `cowboy-robaccia` nella pagina.
3. Ti dà un indirizzo tipo `nome-casuale.netlify.app`. In **Site configuration** puoi cambiare il nome.

(Alternative gratuite: GitHub Pages o Cloudflare Pages.)

## 5. Installala sull'iPhone
1. Apri l'indirizzo in **Safari**.
2. Tocca **Condividi → Aggiungi a schermata Home → Aggiungi**.
3. Apri l'icona: parte a schermo intero come un'app.
4. In fondo alla pagina tocca **Area riservata**, accedi con email e password: compare il pulsante **+** per aggiungere recensioni, e il pulsante **Modifica** dentro ogni scheda. Resti collegato finché non tocchi **Esci**.

## Da sapere
- Il piano gratuito di Supabase mette in pausa i progetti senza attività per circa una settimana. Se succede, entra nel pannello e premi "Restore": i dati non si perdono. Aprire l'app ogni tanto evita il problema.
- Le copertine caricate vengono ridimensionate e salvate nello spazio gratuito di Supabase (qualche GB, ampiamente sufficiente).
- Per aggiornare l'app in futuro, ricarica la cartella su Netlify (Deploys → trascina di nuovo).
- Non condividere mai la tua password né la chiave "secret".
