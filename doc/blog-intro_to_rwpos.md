# Introducing Reputation-Weighted Proof-of-Stake (Part 1)
Hi guys, we're the Sirius (SIRX) developer team, and we're working on a new consensus algorithm called Reputation-Weighted Proof-of-Stake (RWPoS) that'll allow Visa (2000 tps+) transaction speeds while maintaining a degree of centralization that is as low as possible. We'd like to give a short summary of it, and then show you our results so far.

## Background
By the CAP theorem, increasing the throughput of a blockchain necessarily decreases either decentralization or security. Some newer consensus algorithms favour throughput at the expense of decentralization. Some consortium blockchains for example, due to their high degree of centralization and voting mechanics, are vulnerable to a number of economic incentives to bribe block producers or master node operators. Older algorithms don't suffer from these problems, but won't scale. RWPoS solves this by balancing speed and centralization, without introducing any true master nodes or extremely small groups of block producers, and preserving decentralized consensus while increasing transaction speed.

## Rating miners

Since we want the voting process to be immune to political agendas and bribes, we can give each miner or output (we're working with a Proof-of-Stake UTXO-based chain, offering low energy use, and increased privacy over the account model) a score based on his consistency of block contributions, defined by the standard deviation of time between contributions, and history of contributed blocks measured over the whole chain, and then increasing the weight of his stake by this score. Now let's say we have a lot of miners, but only a few hundred are staking on a well-connected VPS with >95% uptime. What we'll end up with after a while of scoring is a group of miners who are well connected, consistent and invested in the chain for a longer period of time, which increases security. It also allows to increase transaction speed, without political machinations or bribes being able to significantly influence them. Of course, we'll still need to keep a handle on the degree of centralization. An easy way to measure this is the **Gini coefficient**.

## Measuring centralization
The Gini coefficient or index reflects the inequality in a distribution, where 1 means total inequality and 0 means perfect equality. The Gini index for global wealth, for example, is around 0.48. We can also use this to measure stake and therefore mining power inequality in a (D)PoS system. For example, Steem's Gini index is somewhere around 0.93.

For simplicity's sake, we'll first run a simulation of a PoS chain, where a node's mining power is proportional to its share of the total market cap, and look at the evolution of the Gini index. Because bigger stakes have a bigger chance to mine, we should expect to see the **Matthew effect**, where the rich slowly get richer, and inequality and thus the Gini index go up.

Since we have to start with some initial distribution of stakes, we'll assume that they're initially distributed like global wealth: according to a **Pareto distribution**. To keep it short, this means that about 80% of the staked SIRX is in the hands of 20% of the stakeholders.  Plotted as a histogram, it looks like this:

![Our initial stake distribution](https://drive.google.com/uc?id=1nUXGDkng7cita0SkCfO7YFpihpAHc7-e&export=download)

This gives a Gini index of 0.47, about the same as global wealth. Now we would like to see how it changes over a few years of mining (we'll ignore any trading). This gives us the following new wealth distribution:

![Final distribution](https://drive.google.com/uc?id=1HNIQJopMUev0eFXdxJls3BVp1QNiRZ-1&export=download)

That doesn't look like it changed a lot, but if we take a look at the evolution of the Gini index over this period, we get a different picture:

![Gini index evolution](https://drive.google.com/uc?id=1RUZolybxyNBp2mbpVi24S9X7MTyu5L-P&export=download)

Inequality (and centralization) are, albeit very slowly, going down! This suggests that the 'rich get richer' effect doesn't seem to apply to PoS systems like Sirius. In fact, others have come to the same conclusion (If you'd like to read it, it's [here](http://nbviewer.jupyter.org/gist/xcthulhu/38f91b65ccaaf6413fd7)). 

In this part we've only looked at unmodified PoS, but in the next part we'll delve more into RWPoS and also post the code used for the simulation, so you can try it out for yourself.

**If you're interested in taking part in our upcoming AMA, or have a question, come talk to us on [Slack](https://slack.getsirius.io/) or [Telegram](https://telegram.getsirius.io/), or visit our [website](https://getsirius.io/)**
