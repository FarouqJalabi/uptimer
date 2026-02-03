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

Monitor build_report x2 ✅ 10:52
La til Faraday, letter å håndtere ting som ingen response, det vi bruker på FT. kanskje overkill?
https://github.com/lostisland/faraday
Gir meg også #success?
report info er kanskje ubruklig?

Website CRUD -> Monitors CRUD ✅ 14:01
nested form for monitor ⁉️
What does the website model do? It does nothing!
Would been easier to switch , should have maybe done it?

Jobben ✅ 14:01
solid_queue:install
Job should really buulk insert reports

Deploy ⁉️ ✅ 16:07
Måtte queue databasen selv

La post api funke for inaktive ⁉️ 16:07

Website start dashboard

Dag 3 08:00 - 16:00
Website dashboard + turbo
Styling
Sending mail on fail # Hvordan ikke spamme?

Dag 4 08:00 - 16:00
Fikse bugs + teste + fikse bugs
Polish

Dag 5 08:00 - 16:00
Presntasjon


