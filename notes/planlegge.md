# Planlegge

## Inspo 
 https://www.37status.com/index.html
 https://www.37status.com/uptime?page=2

 https://downdetector.com/status/twitter/
 https://downforeveryoneorjustme.com/twitter
 https://downdetector.com/status/youtube/

## Rammeverk
Ruby on Rails
SolidQueue

Postgresql
    Litt vanskligere å sette opp i produksjon en sqllite.
    Lar oss bruke jsonb typer, bra for report modellen!
    Hvis hadde mer tid hadde brukt timescaledb (elr noe annet) som er mer laget for å håndetere logger.

Devise
    Kjappest, syntes den er litt irreterende å endre på.

Chartkick (Vurdert)
    Har aldri brukt før men virker lett. En linje for å vise chart.
    Vil ikke ha den fordi chart er unødvendig når den kan kun være 1 eller 0. Gir kanskje mening på dashbordet.

tailwindcss + DiasyUI
    liker tailwind men vil ikke skrive alt fra bunn av så diasyui hjelper

SendGrid
    Til å sende mail, er ukjent aldri send mail i prod 
    trenger jeg sendgrid? https://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-configuration-for-gmail

## Modeller

Website
```ruby
    name
    link optional
    has_many :reports, through: :monitor

    has_one monitor, polymorphic: true, validate_one: true
    accept_nested_attributes_for poller
```

Er usikker om vi trenger ny model for vær monitor type. Rart og å monitor funksjonalitet og nettside info på samme model 

Monitor::Base
```ruby
    belongs_to website
    has_many :reports
    def build_report ERROR
    def should_perform? ERROR
```

Monitor::Active from Monitor::Base
```ruby
    ACCEPTED_RESPONSE_TIME=5.seconds
    validate link
    interval_to_poll
```

Monitor::Passive from 
```ruby
    time_considered_active 5.seconds
    api_key (Burde)
```

Report
```ruby
    up
    info jsonb
```

(Vurderte å ha flere report typer, for aktiv kunne hatt response time)
(Vurderte å la bruker "hente ut" relevant info fra json og få det på chart)

User
```ruby
    has_many websites
```

Incident (Vurdert)
    has_many :reports
    start_time
    end_time
    note :optional

Til vanlig en nettside er nede lenge å ikke bare da vi skjekker. Incident vil også la deg notere hva som skjedde og hvor lenge

```bash
rails new fagprove --database=postgresql --css=tailwind
```

## Jobber
Create reports
```ruby
Monitor::Passive.map &:build_report
Monitor::Active.map &:build_report
```
(Burde catche errors logge og fortsette)

## Tidsbruk
Dag 1 14:09 - 17:00
Planlegge
Setup
Deploy (alex ide)
Innlogging
Report model
Monitor model

Dag 2 08:00 - 16:00
Monitor build_job x2 
Website CRUD + nested form for monitor
Jobben
Website start dashboard

Dag 3 08:00 - 16:00
Website dashboard
Styling
Sending mail on fail # Hvordan ikke spamme?

Dag 4 08:00 - 16:00
Fikse bugs + teste + fikse bugs
Polish

Dag 5 08:00 - 16:00
Presntasjon


## Uløst
Hvordan ikke spamme når nettside er nede?
Hvordan hente ut rapporter mest effektivt og hvordan cache


