---
title: Migration of the objects
---

{% capture fork_dir %}/{{page.collection}}/9-fork/{% endcapture %}
{% assign url_basic_knowledge = fork_dir | append: '1-basic-knowledge.html' %}
{% assign url_to_dos = fork_dir | append: '2-to-dos.html' %}
{% assign url_restrictions_on_use = fork_dir | append: '3-restrictions-on-use.html' %}

{% capture glossary_path %}/{{page.collection}}/7-glossary.html{% endcapture %}
{% assign glossary_child_universe = glossary_path | append: '#Child_Universe' %}
{% assign glossary_creation_bond = glossary_path | append: '#Creation_Bond' %}
{% assign glossary_creator_fee = glossary_path | append: '#Creator_Fee' %}
{% assign glossary_designated_reporter = glossary_path | append: '#Designated_Reporter' %}
{% assign glossary_dispute_window = glossary_path | append: '#Dispute_Window' %}
{% assign glossary_end_time = glossary_path | append: '#End_Time' %}
{% assign glossary_final_outcome_ = glossary_path | append: '#Final_Outcome' %}
{% assign glossary_finalized_market = glossary_path | append: '#Finalized_Market' %}
{% assign glossary_fork = glossary_path | append: '#Fork' %}
{% assign glossary_forking_market = glossary_path | append: '#Forking_Market' %}
{% assign glossary_forking_period = glossary_path | append: '#Forking_Period' %}
{% assign glossary_initial_report = glossary_path | append: '#Initial_Report' %}
{% assign glossary_initial_reporter = glossary_path | append: '#Initial_Reporter' %}
{% assign glossary_invalid_outcome = glossary_path | append: '#Invalid_Outcome' %}
{% assign glossary_losing_universe = glossary_path | append: '#Losing_Universe' %}
{% assign glossary_market = glossary_path | append: '#Market' %}
{% assign glossary_market_creator = glossary_path | append: '#Market_Creator' %}
{% assign glossary_non_finalized_market = glossary_path | append: '#Non-Finalized_Market' %}
{% assign glossary_outcome = glossary_path | append: '#Outcome' %}
{% assign glossary_parent_universe = glossary_path | append: '#Parent_Universe' %}
{% assign glossary_participation_token = glossary_path | append: '#Participation_Token' %}
{% assign glossary_reporting_fee = glossary_path | append: '#Reporting_Fee' %}
{% assign glossary_reporting_fee_pool = glossary_path | append: '#Reporting_Fee_Pool' %}
{% assign glossary_reputation_token = glossary_path | append: '#Reputation_Token' %}
{% assign glossary_roi = glossary_path | append: '#ROI' %}
{% assign glossary_settlement = glossary_path | append: '#Settlement' %}
{% assign glossary_smart_contract = glossary_path | append: '#Smart_Contract' %}
{% assign glossary_share = glossary_path | append: '#Share' %}
{% assign glossary_transaction_fee = glossary_path | append: '#Transaction_Fee' %}
{% assign glossary_unfilled_order = glossary_path | append: '#Unfilled_Order' %}
{% assign glossary_universe = glossary_path | append: '#Universe' %}
{% assign glossary_validity_bond = glossary_path | append: '#Validity_Bond' %}
{% assign glossary_winning_universe = glossary_path | append: '#Winning_Universe' %}

{% capture relationships_image %}/assets/images/{{page.collection}}/fork/migration-of-the-objects/relationships-between-objects.svg{% endcapture %}
{% capture outline_image %}/assets/images/{{page.collection}}/fork/migration-of-the-objects/outline.svg{% endcapture %}
{% capture forking_market_image %}/assets/images/{{page.collection}}/fork/migration-of-the-objects/forking-market.svg{% endcapture %}
{% capture non_forking_market_image %}/assets/images/{{page.collection}}/fork/migration-of-the-objects/non-forking-market.svg{% endcapture %}
{% capture rep_in_wallet_image %}/assets/images/{{page.collection}}/fork/migration-of-the-objects/rep-in-wallet.svg{% endcapture %}
{% capture finalized_market_image %}/assets/images/{{page.collection}}/fork/migration-of-the-objects/finalized-market.svg{% endcapture %}
{% capture dispute_window_image %}/assets/images/{{page.collection}}/fork/migration-of-the-objects/dispute-window.svg{% endcapture %}

# Migratable objects in Augur
This page covers the details of what objects in the Augur system of [contracts]({{ glossary_smart_contract | relative_url }}) are migratable between [parent]({{ glossary_parent_universe | relative_url }}) and [child universes]({{ glossary_child_universe | relative_url }}). However *all* objects are not covered on this page, but only those that are likely to directly affect end users.

# Hierarchical Relationships between Objects
The objects in the [universe]({{ glossary_universe | relative_url }}) form a hierarchical relationship with the universe as a top.
{% capture image_src %}{{ relationships_image | relative_url }}{% endcapture %}
{% include zoom-image.html src=image_src caption="Figure 1. hierarchical relationships between objects" %}

The universe has [REP]({{ glossary_reputation_token | relative_url }}), [Market]({{ glossary_market | relative_url }}), and [Dispute Window]({{ glossary_dispute_window | relative_url }}) attached. And Market and Dispute Window have some attached objects, while REP doesn't have any attached object. The point is that **when forks occur, the lower objects migrate where their upper object migrates, and if the upper object may not migrate then their lower objects may not migrate**. Of course, there are some exceptions, but this principle might help you understand the migration of the objects.

# Overview
The following figure shows where the objects in the [parent universe]({{ glossary_parent_universe | relative_url }}) are migrated after a fork. (Click to enlarge)
{% capture image_src %}{{ outline_image | relative_url }}{% endcapture %}
{% include zoom-image.html src=image_src caption="Figure 2. overview of migration" %}

The red objects can only be migrated to the [winning universe]({{ glossary_winning_universe | relative_url }}), the blues can only be migrated to the [losing universe]({{ glossary_losing_universe | relative_url }}), the purples can be migrated to one of the [child universes]({{ glossary_child_universe | relative_url }}), and the greens cannot be migrated to any child universe.

Before a [fork]({{ glossary_fork | relative_url }}), all objects are in the parent universe. After a fork, in the parent universe, there are the [finalized markets]({{ glossary_finalized_market | relative_url }}), [dispute windows]({{ glossary_dispute_window | relative_url }}), and the objects which are attached to them. The winning universe and the losing universe are created, and the [forking market]({{ glossary_forking_market | relative_url }}), [non-finalized markets]({{ glossary_non_finalized_market | relative_url }}), and [REP]({{ glossary_reputation_token | relative_url }}) are migrated to them.

This can be summarized as follows:

  - The migratable objects are:
    - Forking market
    - Non-Finalized Markets
    - REP
  - The un-migratable objects are:
    - Finalized Markets
    - Dispute Windows
  - The winning universe receives:
    - Forking market and its attached objects
    - Non-Finalized markets
    - REP
  - The losing universe receives:
    - Forking market
    - REP

# Child universe is created by REP holders
A [child universe]({{ glossary_child_universe | relative_url }}) is created when the [REP]({{ glossary_reputation_token | relative_url }}) holder who *first* migrates their REP to it. Even if the [forking market]({{ glossary_forking_market | relative_url }}) has [finalized]({{ glossary_finalized_market | relative_url }}) or the [forking period]({{ glossary_forking_period | relative_url }}) ends, the [child universe]({{ glossary_child_universe | relative_url }}) is not created without migrating REP. And the REP holder who *first* migrates their REP has to pay not only the [transaction fee]({{ glossary_transaction_fee | relative_url }}) of migrating their REP, but also the transaction fee of creating the child universe.

# Migration of Forking Market
{% capture image_src %}{{ forking_market_image | relative_url }}{% endcapture %}
{% include zoom-image.html src=image_src caption="Figure 3. migration of forking market"%}

## Market Itself
The [forking market]({{ glossary_forking_market | relative_url }}) is duplicated in each [child universe]({{ glossary_child_universe | relative_url }}). In a child universe, the forking market is [finalized]({{ glossary_finalized_market | relative_url }}) as the [outcome]({{ glossary_outcome | relative_url }}) that aligns with that particular child universe. (See [basic knowledge]({{ url_basic_knowledge | relative_url }}#what-happens-when-a-fork-starts) for details on how child universes are created.)

This duplication occurs when the child universe is created.  This happens when the *first* [REP]({{ glossary_reputation_token | relative_url }}) holder migrates their REP to that child universe.

## Staked REP
The staked [REP]({{ glossary_reputation_token | relative_url }}) on any [outcome]({{ glossary_outcome | relative_url }}) of the [forking market]({{ glossary_forking_market | relative_url }}) is migrated to the [child universe]({{ glossary_child_universe | relative_url }}) corresponding to the staked outcome.

That REP will be unstaked and refunded to their owners in a child universe when the migration has done. They will also receive a 40% [ROI]({{ glossary_roi | relative_url }}) in additional REP minted in the universe they staked on prior to the fork.

## Attached Objects
The objects which are attached to the [forking market]({{ glossary_forking_market | relative_url }}) are:
 - [share]({{ glossary_share | relative_url }})
 - [unfilled order]({{ glossary_unfilled_order | relative_url }})
 - [creator fee]({{ glossary_creator_fee | relative_url }})
 - [validity bond]({{ glossary_validity_bond | relative_url }})

When the for is [finalized]({{ glossary_finalized_market | relative_url }}), those objects are migrated to the [winning universe]({{ glossary_winning_universe | relative_url }}) by the Augur contracts automatically.

Regarding [validity bond]({{ glossary_validity_bond | relative_url }}), which is paid by the [market creator]({{ glossary_market_creator | relative_url }}) when creating the [market]({{ glossary_market | relative_url }}), if the corresponding outcome of the winning universe is `Invalid`, this bond is paid out to [participation token]({{ glossary_participation_token | relative_url }}) holders in proportion to the amount of participation token in the winning universe. If not `Invalid`, this bond is returned to the market creator in the winning universe.

As to [creation bond]({{ glossary_creation_bond | relative_url }}), which is also paid by the market creator, no longer exists at the time of forking. Since this bond is already used by the [designated reporter]({{ glossary_designated_reporter | relative_url }}) or the first public reporter as the [initial reporter]({{ glossary_initial_reporter | relative_url }})'s stake after the market's [event end time]({{ glossary_end_time | relative_url }}).

# Migration of Non-Forking Markets (not finalized)
{% capture image_src %}{{ non_forking_market_image | relative_url }}{% endcapture %}
{% include zoom-image.html src=image_src caption="Figure 4. migration of non-forking markets (not finalized)" %}
## Market Itself
The non-forking markets which are not [finalized]({{ glossary_finalized_market | relative_url }}) can be migrated only to the [winning universe]({{ glossary_winning_universe | relative_url }}). To migrate those markets, you need to make a transaction for that explicitly. It can be done by anyone, not just the [market creator]({{ glossary_market_creator | relative_url }}), and anytime after finalizing the [forking market]({{ glossary_forking_market | relative_url }}). It is one-way and cannot be reversed.

When you migrate a market, you need to supply [creation bond]({{ glossary_creation_bond | relative_url }}) (which is normally paid by the market creator when creating the market) and you become the [initial reporter]({{ glossary_initial_reporter | relative_url }}) of the market in the [winning universe]({{ glossary_winning_universe | relative_url }}). And if the market is past its [event end time]({{ glossary_end_time | relative_url }}) in the [parent universe]({{ glossary_parent_universe | relative_url }}), the market is reset back to needing an [initial reporting]({{ glossary_initial_report | relative_url }}), and you need to submit the initial report for the market. At this time, the creation bond that you supplied when you migrate a market is used as the initial reporter's stake.

The reason for this is that all of the [REP]({{ glossary_reputation_token | relative_url }}) locked in the non-forking markets in the parent universe is refunded to its respective owners when a [fork]({{ glossary_fork | relative_url }}) starts (so that they migrate their REP to a [child universe]({{ glossary_child_universe | relative_url }}) during the [forking period]({{ glossary_forking_period | relative_url }})), the first reporter must cover the first report REP costs themselves.

The migration of the non-forking markets is not mandatory. Even if a fork ends, you can still trade and [settle]({{ glossary_settlement | relative_url }}) your [shares]({{ glossary_share | relative_url }}) on the markets in the parent universe (See [restrictons on use]({{ url_restrictions_on_use | relative_url }}) for details). However, after a fork starts, markets in the parent universe cannot be [finalized]({{ glossary_finalized_market | relative_url }}). For the market to be finalized, you need to migrate it to the winning universe.

The migration of the non-forking markets can be done by anyone who wants to, but especially the [market creator]({{ glossary_market_creator | relative_url }}) and the traders who have [shares]({{ glossary_share | relative_url }}) in the market may want to do. Since for the market creator to receive the creator fees and for the traders to claim a payout of their shares, the market needs to be finalized (However creator fees are forfeit in [invalid]({{ glossary_invalid_outcome | relative_url }}) markets). It might give them an incentive to migrate markets.

## Staked REP
When a [fork]({{ glossary_fork | relative_url }}) starts, all staked [REP]({{ glossary_reputation_token | relative_url }}) on the non-forking markets are un-staked and refunded to REP holders who staked it so that they migrate their REP during the [forking period]({{ glossary_forking_period | relative_url }}).

## Attached Objects
The objects which are attached to the non-forking market are:
 - [share]({{ glossary_share | relative_url }})
 - [unfilled order]({{ glossary_unfilled_order | relative_url }})
 - [creator fee]({{ glossary_creator_fee | relative_url }})
 - [validity bond]({{ glossary_validity_bond | relative_url }})

Those objects go where the market goes, they cannot be migrated separately.

[Creation bond]({{ glossary_creation_bond | relative_url }}), which is paid by the [market creator]({{ glossary_market_creator | relative_url }}) when creating the market in the [parent universe]({{ glossary_parent_universe | relative_url }}), is refunded to either the market creator or the [initial reporter]({{ glossary_initial_reporter | relative_url }}). At the time of starting a [fork]({{ glossary_fork | relative_url }}), if the market has not received an [initial reporting]({{ glossary_initial_report | relative_url }}), this bond is refunded to the market creator. If it already has received the initial report, then it refunds the [initial reporter]({{ glossary_initial_report | relative_url }}). Because "received the initial reporting" means that the creation bond is already used by the initial reporter as the initial reporter's stake.

# Migration of REP in Wallet
{% capture image_src %}{{ rep_in_wallet_image | relative_url }}{% endcapture %}
{% include zoom-image.html src=image_src caption="Figure 5. migration of REP in wallet" %}

All [REP]({{ glossary_reputation_token | relative_url }}) in the [parent universe]({{ glossary_parent_universe | relative_url }}) that are *not* staked on any [outcome]({{ glossary_outcome | relative_url }}) of the [forking market]({{ glossary_forking_market | relative_url }}) can be migrated to one of the [child universes]({{ glossary_child_universe | relative_url }}) by their owner. The migration of REP must be done during the [forking period]({{ glossary_forking_period | relative_url }}) which lasts 60 days after the [fork]({{ glossary_fork | relative_url }}) starts. After the forking period, the REP in the parent universe can never be migrated to any child universe (See [to-do's]({{ url_to_dos | relative_url }}) for details).

If you are the first person to migrate REP to a [child universe]({{ glossary_child_universe | relative_url }}), child universe creation is triggered and the forking market is also copied into it. In this case, you have to pay the [transaction fee]({{ glossary_transaction_fee | relative_url }}) not only for migrating your REP but also for creating the child universe and copying the forking market.

# Un-migratable objects
## Finalized Markets
{% capture image_src %}{{ finalized_market_image | relative_url }}{% endcapture %}
{% include zoom-image.html src=image_src caption="Figure 6. migration of finalized markets" %}
Finalized markets and their attached objects ([shares]({{ glossary_share | relative_url }}), [unfilled orders]({{ glossary_unfilled_order | relative_url }}), and [creator fee]({{ glossary_creator_fee | relative_url }})) can not be migrated. However, you can still trade and [settle]({{ glossary_settlement | relative_url }}) your [shares]({{ glossary_share | relative_url }}) on the markets during/after a [fork]({{ glossary_fork | relative_url }}).

## Dispute Windows
{% capture image_src %}{{ dispute_window_image | relative_url }}{% endcapture %}
{% include zoom-image.html src=image_src caption="Figure 7. migration of dispute windows" %}

[Dispute Windows]({{ glossary_dispute_window | relative_url }}) and their attached objects ([reporting fee pool]({{ glossary_reporting_fee_pool | relative_url }}), [reporting fees]({{ glossary_reporting_fee | relative_url }}), [validity bonds]({{ glossary_validity_bond | relative_url }}), [creator fees]({{ glossary_creator_fee | relative_url }}), and [participation tokens]({{ glossary_participation_token | relative_url }})) can not be migrated.

Before and after a [fork]({{ glossary_fork | relative_url }}), there is no change in the features of a dispute window. This means Augur collects reporting fees, validity bonds, and creator fees, and adds those to reporting fee pool during a dispute window. At the end of the dispute window, the pool is paid out to participation token owners in proportion to the amount of participation token.

In the [parent universe]({{ glossary_parent_universe | relative_url }}), anytime you can purchase participation tokens, and redeem them. By redeeming them, the [REP]({{ glossary_reputation_token | relative_url }}) that you paid to get the token return to you. Therefore, participation token owners who want to migrate their REP **MUST** redeem their tokens and migrate their REP within 60 days after a fork starts.