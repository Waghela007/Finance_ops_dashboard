use revision;
SELECT * FROM invoices;

## Query 1: Total Amount invoiced per Customer
select Customer_Name, sum(Amount) as total_amount from
invoices
group by customer_name;

## Query 2: Total Amount by status
select Status, sum(Amount) as total_amount
from invoices
group by Status;

## Data cleaning and updates
UPDATE invoices
SET invoice_date = STR_TO_DATE(invoice_date, '%d-%m-%Y %H:%i');
UPDATE invoices
SET Due_date = STR_TO_DATE(Due_Date, '%d-%m-%Y %H:%i');
UPDATE vendor_payments
SET Payment_Date = STR_TO_DATE(Payment_Date, '%Y-%m-%d %H:%i:%s');
ALTER TABLE invoices
DROP COLUMN invoice_datetime;

## Query 3: List of Overdue Invoices with Aging Days
Select *, 
		datediff(date("2023-12-31"),Due_Date) AS Aging
 from invoices
 where Status= "Overdue";
 
 ## Query 4: Total Payment by Vendor
select Vendor, sum(amount) as total_amount
from vendor_payments
group by vendor;

 ## Query 5: Total Payment by Mode
select Mode, sum(amount) as total_amount
from vendor_payments
group by Mode;

## Query 6: Total Payment by Category
select Category,count(Payment_ID) as no_of_Payments, Sum(Amount) as Paid
from vendor_payments
group by 1;

 ## Query 7: Total Payment by Month
select monthname(Payment_Date) as Month, count(Payment_ID) as no_of_Payments, Sum(Amount) as Paid
 from vendor_payments
 group by 1;

 ## Query 7: Total Payment by Month & Category
select Category, monthname(Payment_Date) as Month, Sum(Amount) as Paid
 from vendor_payments
 group by 1,2;
 
 

