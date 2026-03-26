# README
5 days final practical exam. 
Live at: https://uptimer.rubynor.com/


## Oppgave tekst

### **Beskrivelse**

Du skal utvikle en webapplikasjon for monitorering av oppetid for nettsider. Applikasjonen skal kunne registrere nettsider, sjekke deres status automatisk, og vise en historikk over tidligere sjekker.

### **Krav til applikasjonen**

#### **Backend**

* Applikasjonen skal bygges i **Ruby on Rails**.  
* Det skal være en **PostgreSQL**\-database for lagring av data.  
* En bakgrunnsjobb (f.eks. **Sidekiq** eller **SolidQueue**) skal sjekke oppetid for registrerte nettsider med jevne mellomrom. Brukeren skal kunne sette tidsintervall per nettside.  
* Oppetid sjekkes ved å sende en HTTP-forespørsel og registrere statuskode.  
* Passiv oppetidsmonitorering: en ekstern tjeneste skal kunne sende en «heartbeat» på et gitt intervall. Har man ikke mottatt en «heartbeat» innen tidsintervall, skal siden/tjenesten registreres som nede.   
* Brukere skal kunne opprette, redigere, og slette nettsider de vil overvåke (**CRUD**\-funksjonalitet).  
* Et enkelt brukersystem med autentisering skal implementeres (f.eks. Devise). Man skal kunne registrere bruker og logge inn.

#### **Frontend**

* Bruk **Hotwire** (Turbo \+ Stimulus) for en dynamisk brukeropplevelse.  
* Brukerne skal kunne se en oversikt over alle sine registrerte nettsider i et dashboard.  
* Når en nettsides status oppdateres, skal brukergrensesnittet oppdateres uten å måtte gjøre en refresh.  
* Det skal vises en enkel graf over siste 10 sjekker for en nettside.

#### **Hosting**

1. Applikasjonen skal publiseres på kamal-serveren under subdomenet **oppetid.rubynor.com**. (Spør Pål om hjelp til DNS)

#### **Ekstra utfordring**

1. Man skal kunne sette opp e-post varsel dersom en nettside går ned. Bruk sendgrid eller en annen tjeneste til å sende ut e-post.
