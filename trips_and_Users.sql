-- trim the trips tave to have required data 
-- get the total requests per day 
-- get the cancelled request per day 

with data as
        (select request_at, status
        from trips t
        where exists (select 1 from users u 
            where u.banned = 'No' and u.users_id = t.client_id)
        and exists (select 1 from users u 
            where u.banned = 'No' and u.users_id = t.driver_id)
        and date_format(t.request_at, '%Y-%m-%d') 
                between date_format('2013-10-01', '%Y-%m-%d')
                and date_format('2013-10-03','%Y-%m-%d')), 
    total_requests as
        (select request_at, count(1) as no_of_requests
        from data 
        group by request_at), 
    total_cancels as 
        (select request_at, count(1) as no_of_cancels 
        from data 
        where status in ('cancelled_by_driver','cancelled_by_client')
        group by request_at) 
select tr.request_at as Day, 
    round(coalesce(tc.no_of_cancels, 0)/ tr.no_of_requests, 2) as 'Cancellation Rate'
    from total_requests tr
    left join total_cancels tc on tr.request_at = tc.request_at;
