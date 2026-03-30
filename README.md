# Fintech-product-performance-analysis
# Project Background
This project analyzes behavioral and transactional data from **48,723** customers of a Colombian fintech company, collected over a 12-month period. The dataset contains ***3,159,157*** individual financial   transactions . As the company scale, one of the major challenges they face is identifying sustainable drivers of revenue growth while maintaining strong customer engagement and retention. 

***This analysis aims to address that challenge by examining the relationship between revenue performance, product adoption, customer loyalty, By analyzing how customers interact with different financial products .***

**To answer this business problem, the analysis focuses on three key areas:**

**Revenue Performance :** Examines total revenue, average customer lifetime value (CLV), monthly revenue trends, revenue growth patterns, revenue concentration among top customers.

**Product Performance:** Analyzes product adoption, product-level engagement, the relationship between product ownership and churn behavior, and how product depth influences customer activity on the platform.

**Customer Loyalty:** Explores customer segments, transaction frequency, product depth, and customer tenure.

## Data Model
The analysis uses the following data structure.

![image alt](https://github.com/jacobanjola06-collab/Fintech-product-performance-analysis-/blob/8e8b2fa1d685a6e6393f2653952cf655e06c43fc/Screenshot%202026-03-08%20160824.png)

## EXECUTIVE SUMMARY 	
 Revenue growth shows noticeable volatility throughout the year. Strong month over month increases were observed in June ***(28%)*** and August ***(30%)***, but these gains were followed by declines in ***July (22%) and September (24%)***, indicating that revenue performance is not yet consistently stable.
 From a product perspective, ***Savings Accounts and Credit Cards*** are the most widely adopted products, owned by ***78% and 62%*** of customers, making them the primary entry points into the platform. However, Personal Loans and Insurance Products generate the highest average transaction value per user, suggesting that these products contribute more significantly to customer spending activity.
Customer segmentation analysis also shows that ***Power Customers***, despite representing the smallest share of the customer base, generate the highest customer lifetime value (CLV). This indicates that a relatively small group of customers contributes disproportionately to long term revenue potential. Overall, the results suggest that improving revenue stability, increasing adoption of higher value products, and strengthening engagement among high-value customer segments may provide opportunities for more sustainable growth.
## Insight DeepDive 

### Revenue Trends & Risk
![image alt](https://github.com/jacobanjola06-collab/Fintech-product-performance-analysis-/blob/97d18c9a38be79145cf34c529231bac65db38960/Screenshot%202026-03-08%20145048.png)

**•	Revenue Growth Trend (Month over Month)**: Revenue performance across the year shows noticeable volatility rather than consistent growth. The company experienced strong growth in ***June (+28%) and August (+30%)***, indicating periods of high customer activity and transaction volume. However, these gains were quickly followed by declines in ***July (-22%) and September (-24%)***, suggesting that revenue spikes were not sustained over time.

**•	Revenue Concentration**: Revenue distribution across the fintech shows a high level of concentration among top customers. The top ***10% of customers contribute approximately 77.49% of total revenue***, meaning that a relatively small portion of the customer base drives the majority of financial activity. Geographically, revenue is also heavily concentrated in a few key regions. Cundinamarca alone generates ***4.31 trillion*** in revenue, far exceeding other locations and acting as the company’s primary revenue hub. This is followed by Antioquia ***(1.54 trillion)*** and Valle del Cauca ***(1.22 trillion)***, which also contribute significant portions of total platform revenue.                                                                                                                                                                                                                                                                                                                                                                     While these regions generate the highest transaction volume, several smaller regions demonstrate strong customer value despite lower overall revenue. For example, Tolima shows one of the highest average CLV values ***(1.99B) and Magdalena averages 1.90B CLV***.

### Product Performance
![image alt](https://github.com/jacobanjola06-collab/Fintech-product-performance-analysis-/blob/948825dc4ab5a4981ff9d45679b4a72191c0dda0/Screenshot%202026-03-08%20001733.png)

**•	product Adoption**: Savings Accounts and Credit Cards serve as the primary entry points into the fintech product, with adoption rates of ***78.93% and 62.52%*** respectively. Other financial products show lower adoption levels, including Investment Accounts ***(42.56%)***, Personal Loans ***(31.61%)***, and Insurance Products (21.21%). While the platform successfully attracts customers through basic financial services, more advanced financial products are adopted by a smaller share of the user base.

**•	Product Level Engagements**: Despite lower adoption, some products drive higher transaction activity per user. Personal Loans generate the highest engagement, ***averaging 67.05 transactions per user***, followed by Insurance Products ***(65.29)*** and Investment Accounts ***(64.85)***. Savings Accounts average ***64.78*** transactions, while Credit Cards record the lowest engagement at ***62.97*** transactions per user .

**•	Product Depth And Engagement**: Customer engagement varies depending on the number of products owned. Customers with one product show the highest activity, averaging ***75.37*** transactions, while customers with four products also maintain strong engagement at ***70.23*** transactions. Other groups show lower activity levels, including two products ***(58.04), three products (64.36), and five products (58.35)***.Engagement does not increase linearly with the number of products owned, suggesting that product adoption alone does not always translate into higher usage.

### Customer Loyalty & Engagement 

Customer loyalty patterns show that a relatively small group of customers contributes a disproportionately large share of long-term value.

•	Power customers represent only ***4,626 users, yet they generate 1.79 trillion in revenue and have the highest average CLV of 727 million***, making them the most valuable segment on the company. In comparison, ***Regular customers (14,338) generate the largest total revenue at 2.33 trillion with an average CLV of 387 million***, indicating they form the core revenue base of the business. Meanwhile, Occasional customers ***(19,294)*** represent the largest portion of the customer base but contribute significantly lower value, with an average CLV of ***166 million***.

•	From an engagement perspective, medium frequency users dominate the platform with ***25,241 customers and the highest average CLV of 269 million***, showing that consistent but moderate activity levels drive the most stable customer value.

•	Customer tenure analysis also shows that the company has a highly mature customer base, with ***47,405 customers in the 9+ year tenure group***, indicating strong long term retention across the financial service.

•	Finally, product ownership depth shows that customers with one to three products maintain the most stable value levels, with average CLV ranging between ***324 million and 339 million***, suggesting that moderate product adoption is already sufficient to sustain strong customer value.

# Recommendation 
1. ***Strengthen cross selling from high-adoption products to high-engagement products***
Savings Accounts ***(78.9%)*** and Credit Cards ***(62.5%)*** serve as the primary entry points for most customers, while Personal Loans and Insurance Products generate the highest transaction engagement per user (67 and 65 transactions on average).
The company should leverage these widely adopted products as conversion gateways, introducing targeted cross-sell campaigns that encourage savings and credit card users to adopt higher-engagement products that drive deeper financial activity.
2. ***Prioritize retention and expansion of Power Customers***
Power customers represent a small portion of the customer base (4,626 users) but generate 1.79 trillion in revenue with the highest CLV across segments.
Developing targeted loyalty programs, personalized financial offers, and exclusive product benefits for this group can help protect high-value revenue streams and increase long-term customer lifetime value.
3. ***Reduce revenue concentration risk by expanding mid-tier customer value***
With the top 10% of customers contributing 77.5% of total revenue, the platform faces a concentration risk. Improving engagement among regular and medium transaction frequency customers, who represent the largest portion of the user base, can help broaden the revenue base and create more stable long-term growth.
4. ***Expand product depth to increase engagement and lifetime value***
Customers with multiple products demonstrate higher engagement levels, supporting the effectiveness of a multi-product strategy. Encouraging customers to adopt two or more financial products can deepen platform usage and increase both transaction activity and long-term customer value.

## Methodology

The analysis followed a structured workflow:

- Data  preparation using SQL
- Aggregation of key performance metrics
- Exploratory analysis to identify revenue patterns
- Visualization of insights to support business interpretation

## Tools Used
**SQL** –  metric calculation
**Power BI** – visualization of analytical insights

## Key Takeaways

1.Revenue growth is volatile, with strong spikes followed by sharp declines, indicating unstable month-to-month revenue momentum.

2.Revenue is highly concentrated, with the top 10% of customers generating the majority of total revenue and key regions dominating financial activity.

3.Basic financial products drive adoption, while advanced products generate higher engagement once adopted.

4.More products do not necessarily increase usage, as customers with fewer products sometimes show higher transaction activity.

5.A small segment of power customers generates the highest lifetime value, while regular customers form the core revenue base.

6.The platform has strong long-term retention, with a large share of customers remaining active for over nine years.
