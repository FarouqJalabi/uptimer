## Faktisk gjenom føring
Dag 1 14:09 - 17:00
Planlegge ✅
Setup ✅
Deploy ❌
Innlogging ❌
Report model ❌
Monitor model ❌

Dag 2 08:00 - 16:00
Innlogging ✅
Report model ✅
ttps://www.honeybadger.io/blog/rails-activerecord-store/
Burde kanskje hatt flere typer rapporter? 

Monitor model ✅
https://api.rubyonrails.org/classes/ActiveSupport/Duration.html
changed names Monitor::Passive -> Monitor::Heartbeat, Monitor::Active -> Monitor::Fetch 
 monitor by heartbeat ga litt mening i hode mitt. active sier ingenting om hva den faktisk gjør

Monitor build_report x2 ✅
La til Faraday, letter å håndtere ting som ingen response, det vi bruker på FT. kanskje overkill?
https://github.com/lostisland/faraday
Gir meg også #success?
report info er kanskje ubruklig?

Website CRUD -> Monitors CRUD ✅
nested form for monitor ⁉️
What does the website model do? It does nothing!
Would been easier to switch , should have maybe done it?

Jobben ✅
solid_queue:install
Job should really buulk insert reports

Deploy ⁉️ ✅
https://danieltenner.com/setting-up-a-single-rails-8-server-with-postgresql-and-kamal/
Måtte queue databasen selv

La post api funke for inaktive ⁉️

Website start dashboard ❌

Dag 3 09:00 - 17:00
La post api funke for inaktive ✅
curl -X POST http://localhost:3000/api/monitor_heartbeat      -H "Content-Type: application/json"      -d "{\"id\": 1}"

Website dashboard + turbo
Styling
Sending mail on fail # Hvordan ikke spamme?
Validation


Dag 4 08:00 - 16:00
https://blog.siami.fr/smooth-ui-animations-on-server-rendered-html
Email sending on status change ✅
Hover for reports ✅ + nye reports letter hover
Et side for alt
Secret for å si at nettside er oppe
Animasjon for nye reports (vansklig å se) 

Fikse bugs + teste + fikse bugs + responsive
Polish

view transiations? ⁉️
https://turbo-music-drive.fly.dev/
What to show in show?, alex said screenshot

Dag 5 08:00 - 16:00
Presntasjon


