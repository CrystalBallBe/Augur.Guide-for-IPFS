---
title: The Life of a Market
---

{% capture market_creators_link %}/{{page.collection}}/2-market-creators.html{% endcapture %}
{% capture traders_link %}/{{page.collection}}/3-traders.html{% endcapture %}
{% capture position_link %}/{{page.collection}}/7-glossary.html#Position{% endcapture %}
{% capture order_book_link %}/{{page.collection}}/7-glossary.html#Order_Book{% endcapture %}
{% capture invalid_outcome_link %}/{{page.collection}}/7-glossary.html#Invalid_Outcome{% endcapture %}
{% capture designated_reporter_link %}/{{page.collection}}/7-glossary.html#Designated_Reporter{% endcapture %}
{% capture initial_report_link %}/{{page.collection}}/7-glossary.html#Initial_Report{% endcapture %}
{% capture reporter_link %}/{{page.collection}}/7-glossary.html#Reporter{% endcapture %}
{% capture rep_link %}/{{page.collection}}/7-glossary.html#REP{% endcapture %}
{% capture dispute_link %}/{{page.collection}}/7-glossary.html#Dispute{% endcapture %}
{% capture shares_link %}/{{page.collection}}/7-glossary.html#SHARE{% endcapture %}
{% capture finalized_market_link %}/{{page.collection}}/7-glossary.html#Finalized_Market{% endcapture %}

# Getting Started: The Life of a Market

Understanding the process flow of a market is important in using Augur effectively, no matter how you intend to participate. Here is a diagram depicting a simplified view on the life of a prediction market:

<div class="center">
{% capture image_url %}
  /assets/images/{{page.collection}}/Simplified Prediction Market Lifetime.svg
{% endcapture %}
{% include image.html url=image_url description="Figure 1. Simplified Prediction Market Lifetime" %}
</div>

Let's go through the steps:

1. **Market Created** - Someone has decided to ask a question about a particular event that will occur in the future, which kicks off the whole process. Anybody can do this, provided they have enough capital to meet the required setup fees (Ethereum gas) and bonds. Details on market creation can be found on the [Market Creators page]({{ market_creators_link | relative_url }}).

2. **Trading Occurs** - As soon as the market is created, trading/betting on the potential outcomes can begin. It is important to understand that once a market is created, the potential to trade never ends, even if the market has been finalized! That is why Figure 1 depicts the next steps inside the trading step. Additional details on how trading works can be found on the [Traders page]({{ traders_link | relative_url }}).

3. **Market End Time Reached (a.k.a. Reporting Start Time)** - This is a time originally set by the market creator when the market was made. This time triggers the beginning of the reporting phase. The question that the market originally asked now should have an answer that is generally available to the public. It is important to remember that trading on the outcomes can still occur. This is useful for traders looking to exit out of their [position]({{ position_link | relative_url }}) earlier than waiting for the reporting process to finish. However, it can also be dangerous if you still have orders in the [order book]({{ order_book_link | relative_url }}) for a losing outcome - be sure to keep an eye on the markets you are participating in. It is critical to the Augur platform that the market event has happened and an answer is known. If that didn't occur, the market should resolve as [Invalid]({{ invalid_outcome_link | relative_url }}).

4. **Reporting** - It is now time to officially determine what Augur thinks the answer to the market question is (note that only a singular answer is possible in an Augur market, multiple answers will make the market resolve as invalid). In the best case, the market creator's [designated reporter]({{ designated_reporter_link | relative_url }}), which is usually the same address as the market creator, submits an [Initial Report]({{ initial_report_link | relative_url }}) which is the answer the designated reporter believes to be true. However, to prevent lies and scamming, time is needed for [reporters]({{ reporter_link | relative_url }}) ([REP]({{ rep_link | relative_url }}) holders) to review the submitted initial report and potentially [dispute]({{ dispute_link | relative_url }}) that answer for a different one. Assuming the initial report was truthful so no disputes were submitted, the market completes the reporting step. If a dispute was submitted, a more complicated process kicks off which is explained in detail on [Reporting Process]() page.

5. **Settlement** - Now the traders who own [SHARES]({{ shares_link | relative_url }}) in the winning outcome can exchange them back with the market for their winnings. There is actually a couple substeps here. After reporting the market is "resolved", but it needs an extra transaction to be [finalized]({{ finalized_market_link | relative_url }}) which cleans up the market and allows winnings to be redeemed after a three day delay. The 3 day delay was originally built into the Augur smart contracts as a safety valve in case of a critical bug, but that feature was removed while the delay remained. This delay will be removed in future versions of Augur as it no longer serves a purpose. Once the market is finalized, there is nothing left to do, although trading outcome SHARES is still possible, so don't forget to cancel orders in the order book if you have any!