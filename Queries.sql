-- Number of transactions for each cardholder
select a.name,count(c.id)
from card_holder a 
inner join credit_card b 
on a.id = b.cardholder_id 
inner join transaction c 
on b.card = c.card
group by a.name;

--Number of transactions less than 2 dollars
select count(amount) from transaction where amount<2;

--Top credit cards with more possible Fraudulent transactions
select b.card,count(c.amount) as num_of_lower_transactions
from card_holder a 
inner join credit_card b 
on a.id = b.cardholder_id 
inner join transaction c 
on b.card = c.card
where c.amount<2
group by b.card
order by num_of_lower_transactions desc
limit 10;

--Top 100 highest transactions made between 7:00 am and 9:00 am
select *
from transaction c
where date::time between '07:00:00' and '09:00:00'
order by amount desc
LIMIT 100;


--Comparision between 7-9Am and rest of day
select 'Fraudulent transactions between 7 Am and 9Am' as Label,count(id)
from transaction 
where date::time between '07:00:00' and '09:00:00'
and amount<2
union
select 'Fraudulent transactions between rest of day' as Label,count(id)
from transaction 
where date::time not between '09:00:00' and '07:00:00'
and amount<2;


--Top 5 merchants prone to being hacked using small transactions
select b.name,count(a.id)as num_of_transactions
from transaction a
inner join merchant b
on a.id_merchat=b.id
where a.amount<2
group by b.name
order  by num_of_transactions desc 
limit 5;
