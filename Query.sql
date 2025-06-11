/*•	DATA CLEANING:
Cleaning the Item_Fat_Content field ensures data consistency and accuracy in analysis. 
The presence of multiple variations of the same category (e.g., LF, low fat vs. Low Fat) can cause issues in reporting, aggregations, and filtering. 
By standardizing these values, we improve data quality, making it easier to generate insights and maintain uniformity in our datasets.
*/

UPDATE blinkit_data
SET Item_Fat_Content = 
    CASE 
        WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN Item_Fat_Content = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;
/*After executing this query check the data has been cleaned or not using below query*/

SELECT DISTINCT Item_Fat_Content FROM blinkit_data;


