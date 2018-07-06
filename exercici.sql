/* 1 */

select count(*) from usairlineflights.Flights;

/* 2 */

select USAirports.Airport, avg(Flights.DepDelay) as Retard_Sortida_promig, avg(Flights.ArrDelay) as Retard_Arribada_promig 
from usairlineflights.Flights
inner join usairlineflights.USAirports on usairlineflights.Flights.Origin = usairlineflights.USAirports.IATA
group by USAirports.Airport;

/* 3 */
/* He afegit el filtratge per dia del mes, ja que a la mostra de dades "reduida" (2000 registres) que he importat el camp any i el camp mes son tots 2000/12 */

select Origin, colYear, colMonth, DayOfMonths, avg(ArrDelay) 
from usairlineflights.Flights 
group by Origin, colYear, colMonth, DayOfMonths;

/* 4 */
/* Mateix plantejament que a la consulta 3 */

select USAirports.Airport, Flights.colYear, Flights.colMonth, Flights.DayOfMonths, avg(Flights.ArrDelay) as Retard
from usairlineflights.Flights
inner join usairlineflights.USAirports on usairlineflights.Flights.Origin = usairlineflights.USAirports.IATA 
group by Airport, colYear, colMonth, DayOfMonths;

/* 5 */

select Carriers.Description as Companyia, count(*) as Cancelats 
from usairlineflights.Carriers
inner join usairlineflights.Flights on usairlineflights.Carriers.CarrierCode = usairlineflights.Flights.UniqueCarrier
where Flights.Cancelled = 1
group by Carriers.CarrierCode, Flights.Cancelled 
order by Flights.Cancelled asc;

/* 6 */
/* Interpreto que l'identificador de l'avio es el TailNum (crec que es com una matricula) i no el FlightNum que deu ser el codi del vol/ruta. Tot aixo deduit des de la mes absoluta ignorancia ;-)  */

select TailNum, sum(Distance) as Distancia_Total
from usairlineflights.Flights
group by TailNum
order by Distancia_Total desc
limit 10;

/* 7 */
/* Aquest no l'acabo de tenir clar, us ho consulto el dilluns 9 */

select Carriers.Description as Companyia, avg(Flights.ArrDelay) as Retard
from usairlineflights.Carriers
inner join usairlineflights.Flights on usairlineflights.Carriers.CarrierCode = usairlineflights.Flights.UniqueCarrier
where 10 < (select avg(Flights.ArrDelay))
group by Carriers.CarrierCode;

