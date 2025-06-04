---
title: Getting Started
---
{% assign current_collection = site.collections | where: "label", page.collection | first %}

# Getting Started

### What is Augur Anyway?
Augur is a censorship-resistant [prediction market](https://en.wikipedia.org/wiki/Prediction_market) protocol built on top of the [Ethereum blockchain](https://www.ethereum.org/). Prediction markets allow participants to bet on the potential outcomes of future events by trading shares at varying prices. Historically, prediction markets have been limited in scope to narrow domains such as sports gambling or politics due to varying legal restrictions throughout the world. By leveraging the decentralized nature of Ethereum, Augur allows anyone to wager any amount on any potential future event that is publicly verifiable. 

{% capture oracle_link %}/{{page.collection}}/7-glossary.html#Decentralized_Oracle{% endcapture %}
This censorship resistance is key to allowing Augur to unleash the full potential of the ["wisdom of the crowd"](https://en.wikipedia.org/wiki/Wisdom_of_the_crowd). By allowing anyone with useful information about an event to "put their money where their mouth is", more accurate forecasts are made possible which can be useful information for everyone. This information is also brought on chain which means it can be used by other applications on Ethereum. That makes Augur a [decentralized oracle]({{ oracle_link | relative_url }}) as well!

{% capture external_resources_link %}/{{page.collection}}/5-external-resources.html{% endcapture %}
While Augur is technically a protocol based on a set of Ethereum contracts, it is also a product. There is an [Augur App](https://www.augur.net/#download) which is the reference user interface for the protocol. Much of this web site is going to be about how to use Augur through this reference interface. If you don't want to bother downloading the app on your own machine, you can access a hosted version [here](https://augur.casino). There's also a bunch of other user interfaces and tools created by third parties that build on this protocol, we'll go over many of them on the [External Resources page]({{ external_resources_link | relative_url }}).

### Markets

{% capture market_link %}/{{page.collection}}/7-glossary.html#Market{% endcapture %}
Augur usage centers around a collection of [markets]({{ market_link | relative_url }}). A market can be created by anyone, and is supposed to be a question about a future event. Common topics for events are sports and gambling, but Augur can also handle more complex topics like derivatives, bug bounties, or insurance. 

{% capture eth_link %}/{{page.collection}}/7-glossary.html#ETH{% endcapture %}
{% capture order_book_link %}/{{page.collection}}/7-glossary.html#Order_Book{% endcapture %}
{% capture shares_link %}/{{page.collection}}/7-glossary.html#SHARE{% endcapture %}
A trader can escrow a quantity of [ETH]({{ eth_link | relative_url }}) (will change to the stablecoin DAI in the next version of Augur) on a potential outcome of that event and its estimated probability, which is tracked on an [order book]({{ order_book_link | relative_url }}). The order book for Augur is managed on-chain by Ethereum contracts. When two opposing orders are matched (typically by two traders who take opposing views on the likely outcome of the market), the ETH is exchanged for [SHARES]({{ shares_link | relative_url }}) (an ERC20 token). Depending on the final outcome of the market, traders exchange the SHARES back for more ETH than they started with, or less.

{% capture reporting_phase_link %}/{{page.collection}}/4-reporters/1-reporting-process.html{% endcapture %}
{% capture rep_link %}/{{page.collection}}/7-glossary.html#REP{% endcapture %}
{% capture dispute_link %}/{{page.collection}}/7-glossary.html#Dispute{% endcapture %}
Markets go through a series of states, which we'll get into later. Official documentation on the nitty gritty is available on the [Augur Whitepaper]({{current_collection.whitepaper-pdf-url}}) or the [Developer Docs](https://docs.augur.net). One important thing to realize is that **trading never stops**, even after the event has happened. Sometime after the event has happened, the market will enter the [reporting phase]({{ reporting_phase_link | relative_url }}). This is when the winning outcome is decided. Fortunately, you don't have to trust one party to correctly resolve the market. Augur's reporters ([REP]({{ rep_link | relative_url }}) holders) can [dispute]({{ dispute_link | relative_url }}) markets that they believe have been resolved incorrectly. This may take some extra time before winning SHARES can be claimed, but it makes the platform robust and secure through its decentralization.

### What Interests You?

Do you want to create markets and potentially earn fees or spread? Do you want to trade on markets because you think you know more about the event than others? Do you want to secure the oracle by being a reporter and earning fees by doing so? You can take part in one or many of these potential roles. To learn more about them, keep exploring Augur.Guide.
